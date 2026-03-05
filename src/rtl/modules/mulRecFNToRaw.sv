module
    mulRecFNToRaw#(parameter expWidth = 3, parameter sigWidth = 3) (
        input [(`floatControlWidth - 1):0] control,
        input [(expWidth + sigWidth):0] a,
        input [(expWidth + sigWidth):0] b,
        output invalidExc,
        output out_isNaN,
        output out_isInf,
        output out_isZero,
        output out_sign,
        output signed [(expWidth + 1):0] out_sExp,
        output [(sigWidth + 2):0] out_sig
    );

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    wire isNaNA, isInfA, isZeroA, signA;
    wire signed [(expWidth + 1):0] sExpA;
    wire [sigWidth:0] sigA;
    recFNToRawFN#(expWidth, sigWidth)
        recFNToRawFN_a(a, isNaNA, isInfA, isZeroA, signA, sExpA, sigA);
    wire isSigNaNA;
    isSigNaNRecFN#(expWidth, sigWidth) isSigNaN_a(a, isSigNaNA);
    wire isNaNB, isInfB, isZeroB, signB;
    wire signed [(expWidth + 1):0] sExpB;
    wire [sigWidth:0] sigB;
    recFNToRawFN#(expWidth, sigWidth)
        recFNToRawFN_b(b, isNaNB, isInfB, isZeroB, signB, sExpB, sigB);
    wire isSigNaNB;
    isSigNaNRecFN#(expWidth, sigWidth) isSigNaN_b(b, isSigNaNB);
    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    wire notSigNaN_invalidExc = (isInfA && isZeroB) || (isZeroA && isInfB);
    wire notNaN_isInfOut = isInfA || isInfB;
    wire notNaN_isZeroOut = isZeroA || isZeroB;
    wire notNaN_signOut = signA ^ signB;
    wire signed [(expWidth + 1):0] common_sExpOut =
        sExpA + sExpB - (1<<expWidth);
    wire [(sigWidth*2 - 1):0] sigProd = sigA * sigB;
    wire [(sigWidth + 2):0] common_sigOut =
        {sigProd[(sigWidth*2 - 1):(sigWidth - 2)], |sigProd[(sigWidth - 3):0]};
    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    assign invalidExc = isSigNaNA || isSigNaNB || notSigNaN_invalidExc;
    assign out_isInf = notNaN_isInfOut;
    assign out_isZero = notNaN_isZeroOut;
    assign out_sExp = common_sExpOut;
`ifdef HardFloat_propagateNaNPayloads
    assign out_isNaN = isNaNA || isNaNB || notSigNaN_invalidExc;
    wire signNaN;
    wire [(sigWidth - 2):0] fractNaN;
    propagateFloatNaN_mul#(sigWidth)
        propagateNaN(
            control,
            isNaNA,
            signA,
            sigA[(sigWidth - 2):0],
            isNaNB,
            signB,
            sigB[(sigWidth - 2):0],
            signNaN,
            fractNaN
        );
    assign out_sign = out_isNaN ? signNaN : notNaN_signOut;
    assign out_sig = out_isNaN ? {1'b1, fractNaN, 2'b00} : common_sigOut;
`else
    assign out_isNaN = isNaNA || isNaNB;
    assign out_sign = notNaN_signOut;
    assign out_sig = common_sigOut;
`endif

endmodule