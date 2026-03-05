module
    recFNToRecFN#(
        parameter inExpWidth = 3,
        parameter inSigWidth = 3,
        parameter outExpWidth = 3,
        parameter outSigWidth = 3
    ) (
        input [(`floatControlWidth - 1):0] control,
        input [(inExpWidth + inSigWidth):0] in,
        input [2:0] roundingMode,
        output [(outExpWidth + outSigWidth):0] out,
        output [4:0] exceptionFlags
    );

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    wire isNaN, isInf, isZero, sign;
    wire signed [(inExpWidth + 1):0] sExpIn;
    wire [inSigWidth:0] sigIn;
    recFNToRawFN#(inExpWidth, inSigWidth)
        inToRawIn(in, isNaN, isInf, isZero, sign, sExpIn, sigIn);
    wire isSigNaN;
    isSigNaNRecFN#(inExpWidth, inSigWidth) isSigNaNIn(in, isSigNaN);
    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    generate
        if ((inExpWidth == outExpWidth) && (inSigWidth <= outSigWidth)) begin
            /*----------------------------------------------------------------
            *----------------------------------------------------------------*/
            wire [(outExpWidth + outSigWidth):0] tentativeOut =
                in<<(outSigWidth - inSigWidth);
`ifdef HardFloat_propagateNaNPayloads
            assign out = tentativeOut | isNaN<<(outSigWidth - 2);
`else
            assign out =
                isNaN
                    ? {`HardFloat_signDefaultNaN, 3'b111}
                          <<(outExpWidth + outSigWidth - 3)
                          | `HardFloat_fractDefaultNaN(outSigWidth)
                    : tentativeOut;
`endif
            assign exceptionFlags = {isSigNaN, 4'b0000};
        end else begin
            /*----------------------------------------------------------------
            *----------------------------------------------------------------*/
            roundAnyRawFNToRecFN#(
                inExpWidth,
                inSigWidth,
                outExpWidth,
                outSigWidth,
                `flRoundOpt_sigMSBitAlwaysZero
            ) roundRawInToOut(
                    control,
                    isSigNaN,
                    1'b0,
                    isNaN,
                    isInf,
                    isZero,
                    sign,
                    sExpIn,
                    sigIn,
                    roundingMode,
                    out,
                    exceptionFlags
                );
        end
    endgenerate

endmodule