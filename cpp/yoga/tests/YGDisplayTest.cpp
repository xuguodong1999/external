/*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

// @Generated by gentest/gentest.rb from gentest/fixtures/YGDisplayTest.html

#include <gtest/gtest.h>
#include <yoga/Yoga.h>

TEST(YogaTest, display_none) {
  const YGConfigRef config = YGConfigNew();

  const YGNodeRef root = YGNodeNewWithConfig(config);
  YGNodeStyleSetFlexDirection(root, YGFlexDirectionRow);
  YGNodeStyleSetWidth(root, 100);
  YGNodeStyleSetHeight(root, 100);

  const YGNodeRef root_child0 = YGNodeNewWithConfig(config);
  YGNodeStyleSetFlexGrow(root_child0, 1);
  YGNodeInsertChild(root, root_child0, 0);

  const YGNodeRef root_child1 = YGNodeNewWithConfig(config);
  YGNodeStyleSetFlexGrow(root_child1, 1);
  YGNodeStyleSetDisplay(root_child1, YGDisplayNone);
  YGNodeInsertChild(root, root_child1, 1);
  YGNodeCalculateLayout(root, YGUndefined, YGUndefined, YGDirectionLTR);

  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetLeft(root));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetTop(root));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetWidth(root));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetHeight(root));

  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetLeft(root_child0));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetTop(root_child0));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetWidth(root_child0));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetHeight(root_child0));

  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetLeft(root_child1));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetTop(root_child1));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetWidth(root_child1));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetHeight(root_child1));

  YGNodeCalculateLayout(root, YGUndefined, YGUndefined, YGDirectionRTL);

  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetLeft(root));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetTop(root));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetWidth(root));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetHeight(root));

  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetLeft(root_child0));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetTop(root_child0));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetWidth(root_child0));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetHeight(root_child0));

  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetLeft(root_child1));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetTop(root_child1));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetWidth(root_child1));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetHeight(root_child1));

  YGNodeFreeRecursive(root);

  YGConfigFree(config);
}

TEST(YogaTest, display_none_fixed_size) {
  const YGConfigRef config = YGConfigNew();

  const YGNodeRef root = YGNodeNewWithConfig(config);
  YGNodeStyleSetFlexDirection(root, YGFlexDirectionRow);
  YGNodeStyleSetWidth(root, 100);
  YGNodeStyleSetHeight(root, 100);

  const YGNodeRef root_child0 = YGNodeNewWithConfig(config);
  YGNodeStyleSetFlexGrow(root_child0, 1);
  YGNodeInsertChild(root, root_child0, 0);

  const YGNodeRef root_child1 = YGNodeNewWithConfig(config);
  YGNodeStyleSetWidth(root_child1, 20);
  YGNodeStyleSetHeight(root_child1, 20);
  YGNodeStyleSetDisplay(root_child1, YGDisplayNone);
  YGNodeInsertChild(root, root_child1, 1);
  YGNodeCalculateLayout(root, YGUndefined, YGUndefined, YGDirectionLTR);

  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetLeft(root));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetTop(root));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetWidth(root));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetHeight(root));

  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetLeft(root_child0));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetTop(root_child0));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetWidth(root_child0));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetHeight(root_child0));

  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetLeft(root_child1));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetTop(root_child1));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetWidth(root_child1));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetHeight(root_child1));

  YGNodeCalculateLayout(root, YGUndefined, YGUndefined, YGDirectionRTL);

  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetLeft(root));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetTop(root));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetWidth(root));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetHeight(root));

  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetLeft(root_child0));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetTop(root_child0));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetWidth(root_child0));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetHeight(root_child0));

  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetLeft(root_child1));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetTop(root_child1));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetWidth(root_child1));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetHeight(root_child1));

  YGNodeFreeRecursive(root);

  YGConfigFree(config);
}

TEST(YogaTest, display_none_with_margin) {
  const YGConfigRef config = YGConfigNew();

  const YGNodeRef root = YGNodeNewWithConfig(config);
  YGNodeStyleSetFlexDirection(root, YGFlexDirectionRow);
  YGNodeStyleSetWidth(root, 100);
  YGNodeStyleSetHeight(root, 100);

  const YGNodeRef root_child0 = YGNodeNewWithConfig(config);
  YGNodeStyleSetMargin(root_child0, YGEdgeLeft, 10);
  YGNodeStyleSetMargin(root_child0, YGEdgeTop, 10);
  YGNodeStyleSetMargin(root_child0, YGEdgeRight, 10);
  YGNodeStyleSetMargin(root_child0, YGEdgeBottom, 10);
  YGNodeStyleSetWidth(root_child0, 20);
  YGNodeStyleSetHeight(root_child0, 20);
  YGNodeStyleSetDisplay(root_child0, YGDisplayNone);
  YGNodeInsertChild(root, root_child0, 0);

  const YGNodeRef root_child1 = YGNodeNewWithConfig(config);
  YGNodeStyleSetFlexGrow(root_child1, 1);
  YGNodeInsertChild(root, root_child1, 1);
  YGNodeCalculateLayout(root, YGUndefined, YGUndefined, YGDirectionLTR);

  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetLeft(root));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetTop(root));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetWidth(root));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetHeight(root));

  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetLeft(root_child0));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetTop(root_child0));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetWidth(root_child0));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetHeight(root_child0));

  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetLeft(root_child1));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetTop(root_child1));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetWidth(root_child1));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetHeight(root_child1));

  YGNodeCalculateLayout(root, YGUndefined, YGUndefined, YGDirectionRTL);

  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetLeft(root));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetTop(root));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetWidth(root));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetHeight(root));

  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetLeft(root_child0));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetTop(root_child0));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetWidth(root_child0));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetHeight(root_child0));

  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetLeft(root_child1));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetTop(root_child1));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetWidth(root_child1));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetHeight(root_child1));

  YGNodeFreeRecursive(root);

  YGConfigFree(config);
}

TEST(YogaTest, display_none_with_child) {
  const YGConfigRef config = YGConfigNew();

  const YGNodeRef root = YGNodeNewWithConfig(config);
  YGNodeStyleSetFlexDirection(root, YGFlexDirectionRow);
  YGNodeStyleSetWidth(root, 100);
  YGNodeStyleSetHeight(root, 100);

  const YGNodeRef root_child0 = YGNodeNewWithConfig(config);
  YGNodeStyleSetFlexGrow(root_child0, 1);
  YGNodeStyleSetFlexShrink(root_child0, 1);
  YGNodeStyleSetFlexBasisPercent(root_child0, 0);
  YGNodeInsertChild(root, root_child0, 0);

  const YGNodeRef root_child1 = YGNodeNewWithConfig(config);
  YGNodeStyleSetFlexGrow(root_child1, 1);
  YGNodeStyleSetFlexShrink(root_child1, 1);
  YGNodeStyleSetFlexBasisPercent(root_child1, 0);
  YGNodeStyleSetDisplay(root_child1, YGDisplayNone);
  YGNodeInsertChild(root, root_child1, 1);

  const YGNodeRef root_child1_child0 = YGNodeNewWithConfig(config);
  YGNodeStyleSetFlexGrow(root_child1_child0, 1);
  YGNodeStyleSetFlexShrink(root_child1_child0, 1);
  YGNodeStyleSetFlexBasisPercent(root_child1_child0, 0);
  YGNodeStyleSetWidth(root_child1_child0, 20);
  YGNodeInsertChild(root_child1, root_child1_child0, 0);

  const YGNodeRef root_child2 = YGNodeNewWithConfig(config);
  YGNodeStyleSetFlexGrow(root_child2, 1);
  YGNodeStyleSetFlexShrink(root_child2, 1);
  YGNodeStyleSetFlexBasisPercent(root_child2, 0);
  YGNodeInsertChild(root, root_child2, 2);
  YGNodeCalculateLayout(root, YGUndefined, YGUndefined, YGDirectionLTR);

  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetLeft(root));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetTop(root));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetWidth(root));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetHeight(root));

  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetLeft(root_child0));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetTop(root_child0));
  ASSERT_FLOAT_EQ(50, YGNodeLayoutGetWidth(root_child0));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetHeight(root_child0));

  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetLeft(root_child1));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetTop(root_child1));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetWidth(root_child1));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetHeight(root_child1));

  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetLeft(root_child1_child0));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetTop(root_child1_child0));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetWidth(root_child1_child0));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetHeight(root_child1_child0));

  ASSERT_FLOAT_EQ(50, YGNodeLayoutGetLeft(root_child2));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetTop(root_child2));
  ASSERT_FLOAT_EQ(50, YGNodeLayoutGetWidth(root_child2));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetHeight(root_child2));

  YGNodeCalculateLayout(root, YGUndefined, YGUndefined, YGDirectionRTL);

  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetLeft(root));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetTop(root));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetWidth(root));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetHeight(root));

  ASSERT_FLOAT_EQ(50, YGNodeLayoutGetLeft(root_child0));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetTop(root_child0));
  ASSERT_FLOAT_EQ(50, YGNodeLayoutGetWidth(root_child0));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetHeight(root_child0));

  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetLeft(root_child1));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetTop(root_child1));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetWidth(root_child1));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetHeight(root_child1));

  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetLeft(root_child1_child0));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetTop(root_child1_child0));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetWidth(root_child1_child0));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetHeight(root_child1_child0));

  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetLeft(root_child2));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetTop(root_child2));
  ASSERT_FLOAT_EQ(50, YGNodeLayoutGetWidth(root_child2));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetHeight(root_child2));

  YGNodeFreeRecursive(root);

  YGConfigFree(config);
}

TEST(YogaTest, display_none_with_position) {
  const YGConfigRef config = YGConfigNew();

  const YGNodeRef root = YGNodeNewWithConfig(config);
  YGNodeStyleSetFlexDirection(root, YGFlexDirectionRow);
  YGNodeStyleSetWidth(root, 100);
  YGNodeStyleSetHeight(root, 100);

  const YGNodeRef root_child0 = YGNodeNewWithConfig(config);
  YGNodeStyleSetFlexGrow(root_child0, 1);
  YGNodeInsertChild(root, root_child0, 0);

  const YGNodeRef root_child1 = YGNodeNewWithConfig(config);
  YGNodeStyleSetFlexGrow(root_child1, 1);
  YGNodeStyleSetPosition(root_child1, YGEdgeTop, 10);
  YGNodeStyleSetDisplay(root_child1, YGDisplayNone);
  YGNodeInsertChild(root, root_child1, 1);
  YGNodeCalculateLayout(root, YGUndefined, YGUndefined, YGDirectionLTR);

  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetLeft(root));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetTop(root));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetWidth(root));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetHeight(root));

  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetLeft(root_child0));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetTop(root_child0));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetWidth(root_child0));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetHeight(root_child0));

  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetLeft(root_child1));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetTop(root_child1));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetWidth(root_child1));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetHeight(root_child1));

  YGNodeCalculateLayout(root, YGUndefined, YGUndefined, YGDirectionRTL);

  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetLeft(root));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetTop(root));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetWidth(root));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetHeight(root));

  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetLeft(root_child0));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetTop(root_child0));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetWidth(root_child0));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetHeight(root_child0));

  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetLeft(root_child1));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetTop(root_child1));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetWidth(root_child1));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetHeight(root_child1));

  YGNodeFreeRecursive(root);

  YGConfigFree(config);
}

TEST(YogaTest, display_none_with_position_absolute) {
  const YGConfigRef config = YGConfigNew();

  const YGNodeRef root = YGNodeNewWithConfig(config);
  YGNodeStyleSetWidth(root, 100);
  YGNodeStyleSetHeight(root, 100);

  const YGNodeRef root_child0 = YGNodeNewWithConfig(config);
  YGNodeStyleSetPositionType(root_child0, YGPositionTypeAbsolute);
  YGNodeStyleSetWidth(root_child0, 100);
  YGNodeStyleSetHeight(root_child0, 100);
  YGNodeStyleSetDisplay(root_child0, YGDisplayNone);
  YGNodeInsertChild(root, root_child0, 0);
  YGNodeCalculateLayout(root, YGUndefined, YGUndefined, YGDirectionLTR);

  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetLeft(root));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetTop(root));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetWidth(root));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetHeight(root));

  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetLeft(root_child0));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetTop(root_child0));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetWidth(root_child0));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetHeight(root_child0));

  YGNodeCalculateLayout(root, YGUndefined, YGUndefined, YGDirectionRTL);

  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetLeft(root));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetTop(root));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetWidth(root));
  ASSERT_FLOAT_EQ(100, YGNodeLayoutGetHeight(root));

  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetLeft(root_child0));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetTop(root_child0));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetWidth(root_child0));
  ASSERT_FLOAT_EQ(0, YGNodeLayoutGetHeight(root_child0));

  YGNodeFreeRecursive(root);

  YGConfigFree(config);
}
