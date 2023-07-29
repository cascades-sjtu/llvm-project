	.text
	.file	"test.c"
	.globl	my_abs_0_Good                   // -- Begin function my_abs_0_Good
	.p2align	2
	.type	my_abs_0_Good,@function
my_abs_0_Good:                          // @my_abs_0_Good
	.cfi_startproc
// %bb.0:                               // %entry
	subs	w8, w0, w1
	csinc	w0, wzr, w8, le
	ret
.Lfunc_end0:
	.size	my_abs_0_Good, .Lfunc_end0-my_abs_0_Good
	.cfi_endproc
                                        // -- End function
	.globl	my_abs_0_Bad                    // -- Begin function my_abs_0_Bad
	.p2align	2
	.type	my_abs_0_Bad,@function
my_abs_0_Bad:                           // @my_abs_0_Bad
	.cfi_startproc
// %bb.0:                               // %entry
	subs	w8, w0, w1
	b.ge	.LBB1_2
// %bb.1:                               // %cond.true
	mvn	w9, w8
	cmn	w8, #1
	csinc	w0, w9, w8, lt
	ret
.LBB1_2:
	mov	w0, wzr
	ret
.Lfunc_end1:
	.size	my_abs_0_Bad, .Lfunc_end1-my_abs_0_Bad
	.cfi_endproc
                                        // -- End function
	.globl	my_abs_1_Good                   // -- Begin function my_abs_1_Good
	.p2align	2
	.type	my_abs_1_Good,@function
my_abs_1_Good:                          // @my_abs_1_Good
	.cfi_startproc
// %bb.0:                               // %entry
	subs	w8, w0, w1
	csinc	w0, wzr, w8, le
	ret
.Lfunc_end2:
	.size	my_abs_1_Good, .Lfunc_end2-my_abs_1_Good
	.cfi_endproc
                                        // -- End function
	.globl	my_abs_1_Bad                    // -- Begin function my_abs_1_Bad
	.p2align	2
	.type	my_abs_1_Bad,@function
my_abs_1_Bad:                           // @my_abs_1_Bad
	.cfi_startproc
// %bb.0:                               // %entry
	subs	w8, w0, w1
	b.ge	.LBB3_2
// %bb.1:                               // %cond.true
	cmn	w8, #1
	mvn	w9, w8
	csinc	w0, w9, w8, mi
	ret
.LBB3_2:                                // %cond.end
	mov	w0, wzr
	ret
.Lfunc_end3:
	.size	my_abs_1_Bad, .Lfunc_end3-my_abs_1_Bad
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
.Lfunc_end4:
	.size	my_abs_2_Good, .Lfunc_end4-my_abs_2_Good
	.cfi_endproc
                                        // -- End function
	.globl	my_abs_2_Neg                    // -- Begin function my_abs_2_Neg
	.p2align	2
	.type	my_abs_2_Neg,@function
my_abs_2_Neg:                           // @my_abs_2_Neg
	.cfi_startproc
// %bb.0:                               // %entry
	subs	w8, w1, w0
	lsl	w8, w8, #1
	csel	w0, w8, wzr, gt
	ret
.Lfunc_end5:
	.size	my_abs_2_Neg, .Lfunc_end5-my_abs_2_Neg
	.cfi_endproc
                                        // -- End function
	.globl	my_abs_3_Bad                    // -- Begin function my_abs_3_Bad
	.p2align	2
	.type	my_abs_3_Bad,@function
my_abs_3_Bad:                           // @my_abs_3_Bad
	.cfi_startproc
// %bb.0:                               // %entry
	cmp	w0, w1
	b.le	.LBB6_2
// %bb.1:                               // %cond.true
	mvn	w8, w1
	adds	w8, w8, w0
	cneg	w0, w8, mi
	ret
.LBB6_2:                                // %cond.end
	mov	w0, wzr
	ret
.Lfunc_end6:
	.size	my_abs_3_Bad, .Lfunc_end6-my_abs_3_Bad
	.cfi_endproc
                                        // -- End function
	.globl	my_abs_3_Neg                    // -- Begin function my_abs_3_Neg
	.p2align	2
	.type	my_abs_3_Neg,@function
my_abs_3_Neg:                           // @my_abs_3_Neg
	.cfi_startproc
// %bb.0:                               // %entry
	subs	w8, w1, w0
	csinc	w0, wzr, w8, le
	ret
.Lfunc_end7:
	.size	my_abs_3_Neg, .Lfunc_end7-my_abs_3_Neg
	.cfi_endproc
                                        // -- End function
	.globl	my_abs_4_Neg                    // -- Begin function my_abs_4_Neg
	.p2align	2
	.type	my_abs_4_Neg,@function
my_abs_4_Neg:                           // @my_abs_4_Neg
	.cfi_startproc
// %bb.0:                               // %entry
	subs	w8, w0, w1
	csinc	w0, wzr, w8, le
	ret
.Lfunc_end8:
	.size	my_abs_4_Neg, .Lfunc_end8-my_abs_4_Neg
	.cfi_endproc
                                        // -- End function
	.globl	my_abs_4_Bad                    // -- Begin function my_abs_4_Bad
	.p2align	2
	.type	my_abs_4_Bad,@function
my_abs_4_Bad:                           // @my_abs_4_Bad
	.cfi_startproc
// %bb.0:                               // %entry
	cmp	w0, w1
	b.ge	.LBB9_2
// %bb.1:                               // %cond.true
	mvn	w8, w0
	adds	w8, w8, w1
	cneg	w0, w8, mi
	ret
.LBB9_2:                                // %cond.end
	mov	w0, wzr
	ret
.Lfunc_end9:
	.size	my_abs_4_Bad, .Lfunc_end9-my_abs_4_Bad
	.cfi_endproc
                                        // -- End function
	.ident	"clang version 18.0.0 (https://mirrors.tuna.tsinghua.edu.cn/git/llvm-project.git cd547f19ed4c55dcde622f5ee140ec1c73b1876e)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
