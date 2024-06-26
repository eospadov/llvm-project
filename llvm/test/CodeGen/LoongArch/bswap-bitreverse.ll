; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc --mtriple=loongarch32 -mattr=+d --verify-machineinstrs < %s \
; RUN:   | FileCheck %s --check-prefix=LA32
; RUN: llc --mtriple=loongarch64 -mattr=+d --verify-machineinstrs < %s \
; RUN:   | FileCheck %s --check-prefix=LA64

declare i16 @llvm.bitreverse.i16(i16)
declare i32 @llvm.bitreverse.i32(i32)
declare i64 @llvm.bitreverse.i64(i64)
declare i16 @llvm.bswap.i16(i16)
declare i32 @llvm.bswap.i32(i32)
declare i64 @llvm.bswap.i64(i64)

define i16 @test_bswap_bitreverse_i16(i16 %a) nounwind {
; LA32-LABEL: test_bswap_bitreverse_i16:
; LA32:       # %bb.0:
; LA32-NEXT:    revb.2h $a0, $a0
; LA32-NEXT:    bitrev.w $a0, $a0
; LA32-NEXT:    srli.w $a0, $a0, 16
; LA32-NEXT:    ret
;
; LA64-LABEL: test_bswap_bitreverse_i16:
; LA64:       # %bb.0:
; LA64-NEXT:    revb.2h $a0, $a0
; LA64-NEXT:    bitrev.d $a0, $a0
; LA64-NEXT:    srli.d $a0, $a0, 48
; LA64-NEXT:    ret
  %tmp = call i16 @llvm.bswap.i16(i16 %a)
  %tmp2 = call i16 @llvm.bitreverse.i16(i16 %tmp)
  ret i16 %tmp2
}

define i32 @test_bswap_bitreverse_i32(i32 %a) nounwind {
; LA32-LABEL: test_bswap_bitreverse_i32:
; LA32:       # %bb.0:
; LA32-NEXT:    bitrev.4b $a0, $a0
; LA32-NEXT:    ret
;
; LA64-LABEL: test_bswap_bitreverse_i32:
; LA64:       # %bb.0:
; LA64-NEXT:    bitrev.4b $a0, $a0
; LA64-NEXT:    ret
  %tmp = call i32 @llvm.bswap.i32(i32 %a)
  %tmp2 = call i32 @llvm.bitreverse.i32(i32 %tmp)
  ret i32 %tmp2
}

define i64 @test_bswap_bitreverse_i64(i64 %a) nounwind {
; LA32-LABEL: test_bswap_bitreverse_i64:
; LA32:       # %bb.0:
; LA32-NEXT:    bitrev.4b $a0, $a0
; LA32-NEXT:    bitrev.4b $a1, $a1
; LA32-NEXT:    ret
;
; LA64-LABEL: test_bswap_bitreverse_i64:
; LA64:       # %bb.0:
; LA64-NEXT:    bitrev.8b $a0, $a0
; LA64-NEXT:    ret
  %tmp = call i64 @llvm.bswap.i64(i64 %a)
  %tmp2 = call i64 @llvm.bitreverse.i64(i64 %tmp)
  ret i64 %tmp2
}

define i16 @test_bitreverse_bswap_i16(i16 %a) nounwind {
; LA32-LABEL: test_bitreverse_bswap_i16:
; LA32:       # %bb.0:
; LA32-NEXT:    revb.2h $a0, $a0
; LA32-NEXT:    bitrev.w $a0, $a0
; LA32-NEXT:    srli.w $a0, $a0, 16
; LA32-NEXT:    ret
;
; LA64-LABEL: test_bitreverse_bswap_i16:
; LA64:       # %bb.0:
; LA64-NEXT:    revb.2h $a0, $a0
; LA64-NEXT:    bitrev.d $a0, $a0
; LA64-NEXT:    srli.d $a0, $a0, 48
; LA64-NEXT:    ret
  %tmp = call i16 @llvm.bitreverse.i16(i16 %a)
  %tmp2 = call i16 @llvm.bswap.i16(i16 %tmp)
  ret i16 %tmp2
}

define i32 @test_bitreverse_bswap_i32(i32 %a) nounwind {
; LA32-LABEL: test_bitreverse_bswap_i32:
; LA32:       # %bb.0:
; LA32-NEXT:    bitrev.4b $a0, $a0
; LA32-NEXT:    ret
;
; LA64-LABEL: test_bitreverse_bswap_i32:
; LA64:       # %bb.0:
; LA64-NEXT:    bitrev.4b $a0, $a0
; LA64-NEXT:    ret
  %tmp = call i32 @llvm.bitreverse.i32(i32 %a)
  %tmp2 = call i32 @llvm.bswap.i32(i32 %tmp)
  ret i32 %tmp2
}

define i64 @test_bitreverse_bswap_i64(i64 %a) nounwind {
; LA32-LABEL: test_bitreverse_bswap_i64:
; LA32:       # %bb.0:
; LA32-NEXT:    bitrev.4b $a0, $a0
; LA32-NEXT:    bitrev.4b $a1, $a1
; LA32-NEXT:    ret
;
; LA64-LABEL: test_bitreverse_bswap_i64:
; LA64:       # %bb.0:
; LA64-NEXT:    bitrev.8b $a0, $a0
; LA64-NEXT:    ret
  %tmp = call i64 @llvm.bitreverse.i64(i64 %a)
  %tmp2 = call i64 @llvm.bswap.i64(i64 %tmp)
  ret i64 %tmp2
}

define i32 @pr55484(i32 %0) {
; LA32-LABEL: pr55484:
; LA32:       # %bb.0:
; LA32-NEXT:    srli.w $a1, $a0, 8
; LA32-NEXT:    slli.w $a0, $a0, 8
; LA32-NEXT:    or $a0, $a1, $a0
; LA32-NEXT:    ext.w.h $a0, $a0
; LA32-NEXT:    ret
;
; LA64-LABEL: pr55484:
; LA64:       # %bb.0:
; LA64-NEXT:    srli.d $a1, $a0, 8
; LA64-NEXT:    slli.d $a0, $a0, 8
; LA64-NEXT:    or $a0, $a1, $a0
; LA64-NEXT:    ext.w.h $a0, $a0
; LA64-NEXT:    ret
  %2 = lshr i32 %0, 8
  %3 = shl i32 %0, 8
  %4 = or i32 %2, %3
  %5 = trunc i32 %4 to i16
  %6 = sext i16 %5 to i32
  ret i32 %6
}
