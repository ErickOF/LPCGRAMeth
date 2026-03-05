# =============================================================================
# rtl.f - VCS filelist for CgraTemplateRTL RTL sources
# Compilation order:
# - include dirs
# - packages
# - modules
# - top
# =============================================================================

# ---------------------------------------------------------------------------
# Defines
# ---------------------------------------------------------------------------
src/rtl/definitions/hardfloat_consts.svh
src/rtl/definitions/hardfloat_specialize.svh
src/rtl/definitions/riscv_hardfloat_specialize.svh

# ---------------------------------------------------------------------------
# Packages
# ---------------------------------------------------------------------------
src/rtl/pkg/cgra_pkg.sv

# ---------------------------------------------------------------------------
# Modules (alphabetical)
# ---------------------------------------------------------------------------
src/rtl/modules/AdderRTL__fa096d180efec193.sv
src/rtl/modules/AddFN__expWidth_9__sigWidth_23.sv
src/rtl/modules/addRecFN.sv
src/rtl/modules/addRecFNToRaw.sv
src/rtl/modules/AddRecFN__expWidth_9__sigWidth_23.sv
src/rtl/modules/BypassQueue1EntryRTL__0966cc2d8bc57328.sv
src/rtl/modules/BypassQueue1EntryRTL__cacc926f103cc2be.sv
src/rtl/modules/BypassQueueCtrlRTL__num_entries_2.sv
src/rtl/modules/BypassQueueDpathRTL__2b281fcf94e1f0c3.sv
src/rtl/modules/BypassQueueDpathRTL__309dee5507394099.sv
src/rtl/modules/BypassQueueDpathRTL__44de6a10d5685d6c.sv
src/rtl/modules/BypassQueueDpathRTL__4d91d5ee0229de22.sv
src/rtl/modules/BypassQueueDpathRTL__801671a65278f0b3.sv
src/rtl/modules/BypassQueueDpathRTL__8998ccae26c1d488.sv
src/rtl/modules/BypassQueueRTL__2b281fcf94e1f0c3.sv
src/rtl/modules/BypassQueueRTL__309dee5507394099.sv
src/rtl/modules/BypassQueueRTL__44de6a10d5685d6c.sv
src/rtl/modules/BypassQueueRTL__4d91d5ee0229de22.sv
src/rtl/modules/BypassQueueRTL__525283e7a6a59a35.sv
src/rtl/modules/BypassQueueRTL__5bfea575fa5cf9e7.sv
src/rtl/modules/BypassQueueRTL__801671a65278f0b3.sv
src/rtl/modules/BypassQueueRTL__8998ccae26c1d488.sv
src/rtl/modules/ChannelRTL__1970d1f511171c70.sv
src/rtl/modules/ChannelRTL__91cc029d3b0c57f8.sv
src/rtl/modules/ChannelRTL__974ab9d5aef5af27.sv
src/rtl/modules/ChannelRTL__c512bc5b9ecd188f.sv
src/rtl/modules/ChannelRTL__d316842813c529a6.sv
src/rtl/modules/compressBy2.sv
src/rtl/modules/compressBy4.sv
src/rtl/modules/CompRTL__fa096d180efec193.sv
src/rtl/modules/ConstQueueDynamicRTL__04942ff39dc493d7.sv
src/rtl/modules/ConstRTL__fa096d180efec193.sv
src/rtl/modules/ControllerRTL__5c69f8e556492ab7.sv
src/rtl/modules/ControllerRTL__fa3c5e20158080fd.sv
src/rtl/modules/Counter__Type_Bits2__reset_value_2.sv
src/rtl/modules/countLeadingZeros.sv
src/rtl/modules/CreditRecvRTL2SendRTL__8b4e283003268cf5.sv
src/rtl/modules/CreditRecvRTL2SendRTL__c3776f8797b9c668.sv
src/rtl/modules/CrossbarRTL__06481a49e1920669.sv
src/rtl/modules/CrossbarRTL__2e8e5b6a3eee594d.sv
src/rtl/modules/CrossbarRTL__447f8cfcf26711c9.sv
src/rtl/modules/CrossbarRTL__eb4a909a6d47afd9.sv
src/rtl/modules/CtrlMemDynamicRTL__06f86f060b697c96.sv
src/rtl/modules/CtrlMemDynamicRTL__c76262b5eab974b5.sv
src/rtl/modules/DataMemControllerRTL__23a34910cbc5cd47.sv
src/rtl/modules/DataMemControllerRTL__ff601aaa934406d0.sv
src/rtl/modules/DataMemWrapperRTL__0e77cbd1e0ed857e.sv
src/rtl/modules/DataMemWrapperRTL__231814237f3337b4.sv
src/rtl/modules/Div__WIDTH_32__CYCLE_4.sv
src/rtl/modules/division.sv
src/rtl/modules/Encoder__in_nbits_2__out_nbits_1.sv
src/rtl/modules/Encoder__in_nbits_32__out_nbits_5.sv
src/rtl/modules/Encoder__in_nbits_3__out_nbits_2.sv
src/rtl/modules/Encoder__in_nbits_4__out_nbits_2.sv
src/rtl/modules/Encoder__in_nbits_6__out_nbits_3.sv
src/rtl/modules/ExclusiveDivRTL__a007a9f9d00e72b1.sv
src/rtl/modules/FlexibleFuRTL__59f466375d9ce40e.sv
src/rtl/modules/FlexibleFuRTL__9cab1d3407096964.sv
src/rtl/modules/fNToRecFN.sv
src/rtl/modules/FNToRecFN__expWidth_9__sigWidth_23.sv
src/rtl/modules/FpAddRTL__7e2720d75d12a6d7.sv
src/rtl/modules/FpMulRTL__7e2720d75d12a6d7.sv
src/rtl/modules/GlobalReduceUnitRTL__6f81a9119116661f.sv
src/rtl/modules/GlobalReduceUnitRTL__a68241ebe958efcc.sv
src/rtl/modules/GrantRTL__fa096d180efec193.sv
src/rtl/modules/iNFromException.sv
src/rtl/modules/InputUnitCreditRTL__d0e2ec98c86283e8.sv
src/rtl/modules/InputUnitCreditRTL__fb413909b40d24f2.sv
src/rtl/modules/InputUnitRTL__0a4d453f46c7c913.sv
src/rtl/modules/InputUnitRTL__650aef5c30cfb328.sv
src/rtl/modules/InputUnitRTL__82e0351e63c161b5.sv
src/rtl/modules/InputUnitRTL__8a91b11d7203ce5f.sv
src/rtl/modules/InputUnitRTL__b49b617718d7597c.sv
src/rtl/modules/InputUnitRTL__cc02cdef134123ae.sv
src/rtl/modules/isSigNaNRecFN.sv
src/rtl/modules/LinkOrRTL__a54ca58e7852ace8.sv
src/rtl/modules/LogicRTL__fa096d180efec193.sv
src/rtl/modules/LoopControlRTL__fa096d180efec193.sv
src/rtl/modules/lowMaskHiLo.sv
src/rtl/modules/lowMaskLoHi.sv
src/rtl/modules/MemUnitRTL__fa096d180efec193.sv
src/rtl/modules/MulFN__expWidth_9__sigWidth_23.sv
src/rtl/modules/mulRecFN.sv
src/rtl/modules/mulRecFNToFullRaw.sv
src/rtl/modules/mulRecFNToRaw.sv
src/rtl/modules/MulRecFN__expWidth_9__sigWidth_23.sv
src/rtl/modules/MulRTL__fa096d180efec193.sv
src/rtl/modules/Mux__029143f1c1a4c629.sv
src/rtl/modules/Mux__02de6acae753f051.sv
src/rtl/modules/Mux__231db74928a9d294.sv
src/rtl/modules/Mux__3ebf9295f9fd3a5c.sv
src/rtl/modules/Mux__48b29568d81d0de5.sv
src/rtl/modules/Mux__640111cddbd7ccca.sv
src/rtl/modules/Mux__8c935bf8b6adc0e3.sv
src/rtl/modules/Mux__ab8b1dcf5a16f461.sv
src/rtl/modules/Mux__c22975805c9abe20.sv
src/rtl/modules/Mux__Type_MemAccessPacket_32_3_512__0e5e373c0405ceef__ninputs_2.sv
src/rtl/modules/Mux__Type_MemAccessPacket_3_32_512__62fa6e6064d885d7__ninputs_2.sv
src/rtl/modules/Mux__Type_MemAccessPacket_3_32_512__62fa6e6064d885d7__ninputs_3.sv
src/rtl/modules/Mux__Type_MemAccessPacket_3_4_512__8e5c7af30d36e757__ninputs_2.sv
src/rtl/modules/Mux__Type_MemAccessPacket_3_4_512__8e5c7af30d36e757__ninputs_3.sv
src/rtl/modules/Mux__Type_MemAccessPacket_4_3_512__8e5c7af30d36e757__ninputs_2.sv
src/rtl/modules/Mux__Type_MemAccessPacket_4_3_512__8e5c7af30d36e757__ninputs_4.sv
src/rtl/modules/NahRTL__fa096d180efec193.sv
src/rtl/modules/NormalQueueCtrlRTL__num_entries_16.sv
src/rtl/modules/NormalQueueCtrlRTL__num_entries_2.sv
src/rtl/modules/NormalQueueDpathRTL__2d36eadf4911a62a.sv
src/rtl/modules/NormalQueueDpathRTL__309dee5507394099.sv
src/rtl/modules/NormalQueueDpathRTL__3f94efedd36bf361.sv
src/rtl/modules/NormalQueueDpathRTL__44de6a10d5685d6c.sv
src/rtl/modules/NormalQueueDpathRTL__4d91d5ee0229de22.sv
src/rtl/modules/NormalQueueDpathRTL__52a8ec1b3572dd66.sv
src/rtl/modules/NormalQueueDpathRTL__5f2d19df340a1b0f.sv
src/rtl/modules/NormalQueueDpathRTL__704206ac7c36e308.sv
src/rtl/modules/NormalQueueDpathRTL__8998ccae26c1d488.sv
src/rtl/modules/NormalQueueDpathRTL__9de49ef9972cf984.sv
src/rtl/modules/NormalQueueDpathRTL__dc5976e92cb1cf9d.sv
src/rtl/modules/NormalQueueDpathRTL__e10c2d77bcb9538e.sv
src/rtl/modules/NormalQueueRTL__2d36eadf4911a62a.sv
src/rtl/modules/NormalQueueRTL__309dee5507394099.sv
src/rtl/modules/NormalQueueRTL__3f94efedd36bf361.sv
src/rtl/modules/NormalQueueRTL__44de6a10d5685d6c.sv
src/rtl/modules/NormalQueueRTL__4d91d5ee0229de22.sv
src/rtl/modules/NormalQueueRTL__52a8ec1b3572dd66.sv
src/rtl/modules/NormalQueueRTL__5f2d19df340a1b0f.sv
src/rtl/modules/NormalQueueRTL__704206ac7c36e308.sv
src/rtl/modules/NormalQueueRTL__8998ccae26c1d488.sv
src/rtl/modules/NormalQueueRTL__9de49ef9972cf984.sv
src/rtl/modules/NormalQueueRTL__dc5976e92cb1cf9d.sv
src/rtl/modules/NormalQueueRTL__e10c2d77bcb9538e.sv
src/rtl/modules/OutputUnitCreditRTL__b299f27b560c5025.sv
src/rtl/modules/OutputUnitCreditRTL__d03a8e7c366bf9eb.sv
src/rtl/modules/OutputUnitRTL__080a73c660696c5b.sv
src/rtl/modules/OutputUnitRTL__4a4f552829f5844d.sv
src/rtl/modules/OutputUnitRTL__6406738047a14a77.sv
src/rtl/modules/OutputUnitRTL__9213f9284de16e3b.sv
src/rtl/modules/OutputUnitRTL__a9946f5ad8907102.sv
src/rtl/modules/OutputUnitRTL__ce3631a75da10e4c.sv
src/rtl/modules/PhiRTL__fa096d180efec193.sv
src/rtl/modules/pipeline_division.sv
src/rtl/modules/recFNToFN.sv
src/rtl/modules/RecFNToFN__expWidth_9__sigWidth_23.sv
src/rtl/modules/recFNToRawFN.sv
src/rtl/modules/recFNToRecFN.sv
src/rtl/modules/RecvRTL2CreditSendRTL__b299f27b560c5025.sv
src/rtl/modules/RecvRTL2CreditSendRTL__d03a8e7c366bf9eb.sv
src/rtl/modules/RegEnRst__Type_Bits2__reset_value_1.sv
src/rtl/modules/RegEnRst__Type_Bits32__reset_value_1.sv
src/rtl/modules/RegEnRst__Type_Bits3__reset_value_1.sv
src/rtl/modules/RegEnRst__Type_Bits4__reset_value_1.sv
src/rtl/modules/RegEnRst__Type_Bits6__reset_value_1.sv
src/rtl/modules/RegisterBankRTL__01c957f3d2dd8862.sv
src/rtl/modules/RegisterBankRTL__7af232d7d9d1d953.sv
src/rtl/modules/RegisterBankRTL__875c77c0f9073b7c.sv
src/rtl/modules/RegisterBankRTL__e5fa866620bad084.sv
src/rtl/modules/RegisterClusterRTL__8a44c1a18964df48.sv
src/rtl/modules/RegisterFile__00df3ce7194a596f.sv
src/rtl/modules/RegisterFile__0addb5da4a055f50.sv
src/rtl/modules/RegisterFile__14fb828f022f9b03.sv
src/rtl/modules/RegisterFile__1d4e07673f8d2d02.sv
src/rtl/modules/RegisterFile__217468e476601edf.sv
src/rtl/modules/RegisterFile__4512aa6646b51254.sv
src/rtl/modules/RegisterFile__660559ed7d54723d.sv
src/rtl/modules/RegisterFile__84f0703fd9bfd535.sv
src/rtl/modules/RegisterFile__88cee4889c541961.sv
src/rtl/modules/RegisterFile__89fbc0c7427180f1.sv
src/rtl/modules/RegisterFile__9540bc60de8fbc35.sv
src/rtl/modules/RegisterFile__9786ab45f2eef562.sv
src/rtl/modules/RegisterFile__a48380321b2771c3.sv
src/rtl/modules/RegisterFile__c97a00dce3981e0a.sv
src/rtl/modules/RegisterFile__d02ace6a21999072.sv
src/rtl/modules/RegisterFile__da749a1852bb59a5.sv
src/rtl/modules/RegisterFile__e0c26c9518ccc1c5.sv
src/rtl/modules/RegisterFile__fc6bf454ec3d52a7.sv
src/rtl/modules/RetRTL__fa096d180efec193.sv
src/rtl/modules/reverse.sv
src/rtl/modules/RingNetworkRTL__344ed987b950e64f.sv
src/rtl/modules/RingNetworkRTL__7fff187ff15cb033.sv
src/rtl/modules/RingRouterRTL__795a7ef5c610671c.sv
src/rtl/modules/RingRouterRTL__de9fce29d18eb239.sv
src/rtl/modules/RingRouteUnitRTL__ebc4c4285a30cd6a.sv
src/rtl/modules/RingRouteUnitRTL__feefaee243610805.sv
src/rtl/modules/roundAnyRawFNToRecFN.sv
src/rtl/modules/roundRawFNToRecFN.sv
src/rtl/modules/RoundRobinArbiterEn__nreqs_2.sv
src/rtl/modules/RoundRobinArbiterEn__nreqs_3.sv
src/rtl/modules/RoundRobinArbiterEn__nreqs_32.sv
src/rtl/modules/RoundRobinArbiterEn__nreqs_4.sv
src/rtl/modules/RoundRobinArbiterEn__nreqs_6.sv
src/rtl/modules/SelRTL__fa096d180efec193.sv
src/rtl/modules/ShifterRTL__fa096d180efec193.sv
src/rtl/modules/SwitchUnitRTL__384bac67206db73f.sv
src/rtl/modules/SwitchUnitRTL__51ac93e9c686b5af.sv
src/rtl/modules/SwitchUnitRTL__559e235c7e27ff40.sv
src/rtl/modules/SwitchUnitRTL__80ba1a3063bf34da.sv
src/rtl/modules/SwitchUnitRTL__ad8349834852327a.sv
src/rtl/modules/SwitchUnitRTL__c8a0f69360b17a87.sv
src/rtl/modules/SwitchUnitRTL__da45a6cfd5b55ca9.sv
src/rtl/modules/SwitchUnitRTL__efdfbcb5ecfe96a9.sv
src/rtl/modules/TileRTL__3a101fa20c835a71.sv
src/rtl/modules/TileRTL__965c10bd53d24586.sv
src/rtl/modules/XbarBypassQueueRTL__1b5921410712b1fe.sv
src/rtl/modules/XbarBypassQueueRTL__60b105be9bc00068.sv
src/rtl/modules/XbarBypassQueueRTL__9671b847394a6dc3.sv
src/rtl/modules/XbarBypassQueueRTL__b1156f5ce61f0ae4.sv
src/rtl/modules/XbarRouteUnitRTL__34e11fe36f929554.sv
src/rtl/modules/XbarRouteUnitRTL__4e10cc384ffeb110.sv
src/rtl/modules/XbarRouteUnitRTL__541d468b12def23d.sv
src/rtl/modules/XbarRouteUnitRTL__9295e28843e34934.sv
src/rtl/modules/XbarRouteUnitRTL__b4ff6020003d1be0.sv
src/rtl/modules/XbarRouteUnitRTL__f784643ba22a3629.sv
src/rtl/modules/XbarRTL__387c2bc903b392a4.sv
src/rtl/modules/XbarRTL__40ca80b1d76a0751.sv

# ---------------------------------------------------------------------------
# RTL top
# ---------------------------------------------------------------------------
src/rtl/top/CgraTemplateRTL.sv
