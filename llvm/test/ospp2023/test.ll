; ModuleID = 'test.c'
source_filename = "test.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local i32 @my_abs_1_Good(i32 noundef %x, i32 noundef %y) local_unnamed_addr #0 {
entry:
  %cmp = icmp sgt i32 %x, %y
  %add = add nsw i32 %x, 1
  %sub = sub i32 %add, %y
  %cond = select i1 %cmp, i32 %sub, i32 0
  ret i32 %cond
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local i32 @my_abs_2_Good(i32 noundef %x, i32 noundef %y) local_unnamed_addr #0 {
entry:
  %cmp = icmp sgt i32 %x, %y
  %sub = sub nsw i32 %x, %y
  %mul = shl nsw i32 %sub, 1
  %cond = select i1 %cmp, i32 %mul, i32 0
  ret i32 %cond
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none) uwtable
define dso_local i32 @my_abs_3_Bad(i32 noundef %x, i32 noundef %y) local_unnamed_addr #1 {
entry:
  %cmp = icmp sgt i32 %x, %y
  br i1 %cmp, label %cond.true, label %cond.end

cond.true:                                        ; preds = %entry
  %0 = xor i32 %y, -1
  %sub1 = add i32 %0, %x
  %call = tail call i32 @llvm.abs.i32(i32 %sub1, i1 true)
  br label %cond.end

cond.end:                                         ; preds = %entry, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ 0, %entry ]
  ret i32 %cond
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local i32 @my_abs_4_Good(i32 noundef %x, i32 noundef %y) local_unnamed_addr #0 {
entry:
  %cmp = icmp sgt i32 %x, %y
  %.neg = add i32 %x, 1
  %sub1.neg = sub i32 %.neg, %y
  %cond = select i1 %cmp, i32 %sub1.neg, i32 0
  ret i32 %cond
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none) uwtable
define dso_local i32 @my_abs_5_Bad(i32 noundef %x, i32 noundef %y) local_unnamed_addr #1 {
entry:
  %cmp = icmp slt i32 %x, %y
  br i1 %cmp, label %cond.true, label %cond.end

cond.true:                                        ; preds = %entry
  %add = add nsw i32 %x, 1
  %sub = sub i32 %add, %y
  %call = tail call i32 @llvm.abs.i32(i32 %sub, i1 true)
  br label %cond.end

cond.end:                                         ; preds = %entry, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ 0, %entry ]
  ret i32 %cond
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local i32 @my_abs_6_Good(i32 noundef %x, i32 noundef %y) local_unnamed_addr #0 {
entry:
  %cmp = icmp slt i32 %x, %y
  %sub.neg = sub i32 %y, %x
  %mul.neg = shl i32 %sub.neg, 1
  %cond = select i1 %cmp, i32 %mul.neg, i32 0
  ret i32 %cond
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local i32 @my_abs_7_Good(i32 noundef %x, i32 noundef %y) local_unnamed_addr #0 {
entry:
  %cmp = icmp slt i32 %x, %y
  %reass.sub = sub i32 %y, %x
  %sub1.neg = add i32 %reass.sub, 1
  %cond = select i1 %cmp, i32 %sub1.neg, i32 0
  ret i32 %cond
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none) uwtable
define dso_local i32 @my_abs_8_Bad(i32 noundef %x, i32 noundef %y) local_unnamed_addr #1 {
entry:
  %cmp = icmp slt i32 %x, %y
  br i1 %cmp, label %cond.true, label %cond.end

cond.true:                                        ; preds = %entry
  %0 = xor i32 %x, -1
  %sub1 = add i32 %0, %y
  %call = tail call i32 @llvm.abs.i32(i32 %sub1, i1 true)
  br label %cond.end

cond.end:                                         ; preds = %entry, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ 0, %entry ]
  ret i32 %cond
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.abs.i32(i32, i1 immarg) #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+v8a,-fmv" }
attributes #1 = { mustprogress nofree nosync nounwind willreturn memory(none) uwtable "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+v8a,-fmv" }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 2}
!2 = !{i32 7, !"frame-pointer", i32 1}
!3 = !{!"clang version 17.0.0 (https://mirrors.tuna.tsinghua.edu.cn/git/llvm-project.git 946450f3a2712f8a129d43bbce058177e9d238cf)"}
