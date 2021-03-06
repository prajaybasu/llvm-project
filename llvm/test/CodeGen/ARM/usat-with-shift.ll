; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=armv6-eabi %s -o - | FileCheck %s
; RUN: llc -mtriple=thumbv8.1m.main-arm-none-eabi -mattr=+dsp %s -o - | FileCheck %s

define arm_aapcs_vfpcc i32 @usat_lsl(i32 %num){
; CHECK-LABEL:  usat_lsl
; CHECK:        @ %bb.0: @ %entry
; CHECK-NEXT: 	usat	r0, #7, r0, lsl #2
; CHECK-NEXT:   bx	lr
entry:
  %shl = shl i32 %num, 2
  %0 = tail call i32 @llvm.arm.usat(i32 %shl, i32 7)
  ret i32 %0
}

define arm_aapcs_vfpcc i32 @usat_asr(i32 %num){
; CHECK-LABEL:  usat_asr
; CHECK:        @ %bb.0: @ %entry
; CHECK-NEXT:   usat	r0, #7, r0, asr #2
; CHECK-NEXT:   bx	lr
entry:
  %shr = ashr i32 %num, 2
  %0 = tail call i32 @llvm.arm.usat(i32 %shr, i32 7)
  ret i32 %0
}

declare i32 @llvm.arm.usat(i32, i32)
