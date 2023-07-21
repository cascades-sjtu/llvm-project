	.text
	.file	"test.c"
	.globl	my_abs_1                        // -- Begin function my_abs_1
	.p2align	2
	.type	my_abs_1,@function
my_abs_1:                               // @my_abs_1
	.cfi_startproc
// %bb.0:                               // %entry
	subs	w8, w0, w1
	csinc	w0, wzr, w8, le
	ret
.Lfunc_end0:
	.size	my_abs_1, .Lfunc_end0-my_abs_1
	.cfi_endproc
                                        // -- End function
	.globl	my_abs_2                        // -- Begin function my_abs_2
	.p2align	2
	.type	my_abs_2,@function
my_abs_2:                               // @my_abs_2
	.cfi_startproc
// %bb.0:                               // %entry
	subs	w8, w0, w1
	lsl	w8, w8, #1
	csel	w0, w8, wzr, gt
	ret
.Lfunc_end1:
	.size	my_abs_2, .Lfunc_end1-my_abs_2
	.cfi_endproc
                                        // -- End function
	.globl	my_abs_3                        // -- Begin function my_abs_3
	.p2align	2
	.type	my_abs_3,@function
my_abs_3:                               // @my_abs_3
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
	.size	my_abs_3, .Lfunc_end2-my_abs_3
	.cfi_endproc
                                        // -- End function
	.globl	my_abs_4                        // -- Begin function my_abs_4
	.p2align	2
	.type	my_abs_4,@function
my_abs_4:                               // @my_abs_4
	.cfi_startproc
// %bb.0:                               // %entry
	subs	w8, w0, w1
	csinc	w0, wzr, w8, le
	ret
.Lfunc_end3:
	.size	my_abs_4, .Lfunc_end3-my_abs_4
	.cfi_endproc
                                        // -- End function
	.ident	"clang version 17.0.0 (https://mirrors.tuna.tsinghua.edu.cn/git/llvm-project.git e45a0c299449b48ac882c08c92a56952d893129d)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
