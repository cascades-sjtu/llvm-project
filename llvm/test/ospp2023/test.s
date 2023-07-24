	.text
	.file	"test.c"
	.globl	my_abs_1_Good                   // -- Begin function my_abs_1_Good
	.p2align	2
	.type	my_abs_1_Good,@function
my_abs_1_Good:                          // @my_abs_1_Good
	.cfi_startproc
// %bb.0:                               // %entry
	subs	w8, w0, w1
	csinc	w0, wzr, w8, le
	ret
.Lfunc_end0:
	.size	my_abs_1_Good, .Lfunc_end0-my_abs_1_Good
	.cfi_endproc
                                        // -- End function
	.globl	my_abs_2_Good                   // -- Begin function my_abs_2_Good
	.p2align	2
	.type	my_abs_2_Good,@function
my_abs_2_Good:                          // @my_abs_2_Good
	.cfi_startproc
// %bb.0:                               // %entry
	subs	w8, w0, w1
	lsl	w8, w8, #1
	csel	w0, w8, wzr, gt
	ret
.Lfunc_end1:
	.size	my_abs_2_Good, .Lfunc_end1-my_abs_2_Good
	.cfi_endproc
                                        // -- End function
	.globl	my_abs_3_Bad                    // -- Begin function my_abs_3_Bad
	.p2align	2
	.type	my_abs_3_Bad,@function
my_abs_3_Bad:                           // @my_abs_3_Bad
	.cfi_startproc
// %bb.0:                               // %entry
	cmp	w0, w1
	b.le	.LBB2_2
// %bb.1:                               // %cond.true
	mvn	w8, w1
	adds	w8, w8, w0
	cneg	w0, w8, mi
	ret
.LBB2_2:                                // %cond.end
	mov	w0, wzr
	ret
.Lfunc_end2:
	.size	my_abs_3_Bad, .Lfunc_end2-my_abs_3_Bad
	.cfi_endproc
                                        // -- End function
	.globl	my_abs_4_Good                   // -- Begin function my_abs_4_Good
	.p2align	2
	.type	my_abs_4_Good,@function
my_abs_4_Good:                          // @my_abs_4_Good
	.cfi_startproc
// %bb.0:                               // %entry
	subs	w8, w0, w1
	csinc	w0, wzr, w8, le
	ret
.Lfunc_end3:
	.size	my_abs_4_Good, .Lfunc_end3-my_abs_4_Good
	.cfi_endproc
                                        // -- End function
	.globl	my_abs_5_Bad                    // -- Begin function my_abs_5_Bad
	.p2align	2
	.type	my_abs_5_Bad,@function
my_abs_5_Bad:                           // @my_abs_5_Bad
	.cfi_startproc
// %bb.0:                               // %entry
	subs	w8, w0, w1
	b.ge	.LBB4_2
// %bb.1:                               // %cond.true
	cmn	w8, #1
	mvn	w9, w8
	csinc	w0, w9, w8, mi
	ret
.LBB4_2:                                // %cond.end
	mov	w0, wzr
	ret
.Lfunc_end4:
	.size	my_abs_5_Bad, .Lfunc_end4-my_abs_5_Bad
	.cfi_endproc
                                        // -- End function
	.globl	my_abs_6_Good                   // -- Begin function my_abs_6_Good
	.p2align	2
	.type	my_abs_6_Good,@function
my_abs_6_Good:                          // @my_abs_6_Good
	.cfi_startproc
// %bb.0:                               // %entry
	subs	w8, w1, w0
	lsl	w8, w8, #1
	csel	w0, w8, wzr, gt
	ret
.Lfunc_end5:
	.size	my_abs_6_Good, .Lfunc_end5-my_abs_6_Good
	.cfi_endproc
                                        // -- End function
	.globl	my_abs_7_Good                   // -- Begin function my_abs_7_Good
	.p2align	2
	.type	my_abs_7_Good,@function
my_abs_7_Good:                          // @my_abs_7_Good
	.cfi_startproc
// %bb.0:                               // %entry
	subs	w8, w1, w0
	csinc	w0, wzr, w8, le
	ret
.Lfunc_end6:
	.size	my_abs_7_Good, .Lfunc_end6-my_abs_7_Good
	.cfi_endproc
                                        // -- End function
	.globl	my_abs_8_Bad                    // -- Begin function my_abs_8_Bad
	.p2align	2
	.type	my_abs_8_Bad,@function
my_abs_8_Bad:                           // @my_abs_8_Bad
	.cfi_startproc
// %bb.0:                               // %entry
	cmp	w0, w1
	b.ge	.LBB7_2
// %bb.1:                               // %cond.true
	mvn	w8, w0
	adds	w8, w8, w1
	cneg	w0, w8, mi
	ret
.LBB7_2:                                // %cond.end
	mov	w0, wzr
	ret
.Lfunc_end7:
	.size	my_abs_8_Bad, .Lfunc_end7-my_abs_8_Bad
	.cfi_endproc
                                        // -- End function
	.ident	"clang version 17.0.0 (https://mirrors.tuna.tsinghua.edu.cn/git/llvm-project.git 946450f3a2712f8a129d43bbce058177e9d238cf)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
