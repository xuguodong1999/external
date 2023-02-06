/*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

// @Generated by gentest/gentest.rb from gentest/fixtures/YGDisplayTest.html

using System;
using NUnit.Framework;

namespace Facebook.Yoga
{
    [TestFixture]
    public class YGDisplayTest
    {
        [Test]
        public void Test_display_none()
        {
            YogaConfig config = new YogaConfig();

            YogaNode root = new YogaNode(config);
            root.FlexDirection = YogaFlexDirection.Row;
            root.Width = 100;
            root.Height = 100;

            YogaNode root_child0 = new YogaNode(config);
            root_child0.FlexGrow = 1;
            root.Insert(0, root_child0);

            YogaNode root_child1 = new YogaNode(config);
            root_child1.FlexGrow = 1;
            root_child1.Display = YogaDisplay.None;
            root.Insert(1, root_child1);
            root.StyleDirection = YogaDirection.LTR;
            root.CalculateLayout();

            Assert.AreEqual(0f, root.LayoutX);
            Assert.AreEqual(0f, root.LayoutY);
            Assert.AreEqual(100f, root.LayoutWidth);
            Assert.AreEqual(100f, root.LayoutHeight);

            Assert.AreEqual(0f, root_child0.LayoutX);
            Assert.AreEqual(0f, root_child0.LayoutY);
            Assert.AreEqual(100f, root_child0.LayoutWidth);
            Assert.AreEqual(100f, root_child0.LayoutHeight);

            Assert.AreEqual(0f, root_child1.LayoutX);
            Assert.AreEqual(0f, root_child1.LayoutY);
            Assert.AreEqual(0f, root_child1.LayoutWidth);
            Assert.AreEqual(0f, root_child1.LayoutHeight);

            root.StyleDirection = YogaDirection.RTL;
            root.CalculateLayout();

            Assert.AreEqual(0f, root.LayoutX);
            Assert.AreEqual(0f, root.LayoutY);
            Assert.AreEqual(100f, root.LayoutWidth);
            Assert.AreEqual(100f, root.LayoutHeight);

            Assert.AreEqual(0f, root_child0.LayoutX);
            Assert.AreEqual(0f, root_child0.LayoutY);
            Assert.AreEqual(100f, root_child0.LayoutWidth);
            Assert.AreEqual(100f, root_child0.LayoutHeight);

            Assert.AreEqual(0f, root_child1.LayoutX);
            Assert.AreEqual(0f, root_child1.LayoutY);
            Assert.AreEqual(0f, root_child1.LayoutWidth);
            Assert.AreEqual(0f, root_child1.LayoutHeight);
        }

        [Test]
        public void Test_display_none_fixed_size()
        {
            YogaConfig config = new YogaConfig();

            YogaNode root = new YogaNode(config);
            root.FlexDirection = YogaFlexDirection.Row;
            root.Width = 100;
            root.Height = 100;

            YogaNode root_child0 = new YogaNode(config);
            root_child0.FlexGrow = 1;
            root.Insert(0, root_child0);

            YogaNode root_child1 = new YogaNode(config);
            root_child1.Width = 20;
            root_child1.Height = 20;
            root_child1.Display = YogaDisplay.None;
            root.Insert(1, root_child1);
            root.StyleDirection = YogaDirection.LTR;
            root.CalculateLayout();

            Assert.AreEqual(0f, root.LayoutX);
            Assert.AreEqual(0f, root.LayoutY);
            Assert.AreEqual(100f, root.LayoutWidth);
            Assert.AreEqual(100f, root.LayoutHeight);

            Assert.AreEqual(0f, root_child0.LayoutX);
            Assert.AreEqual(0f, root_child0.LayoutY);
            Assert.AreEqual(100f, root_child0.LayoutWidth);
            Assert.AreEqual(100f, root_child0.LayoutHeight);

            Assert.AreEqual(0f, root_child1.LayoutX);
            Assert.AreEqual(0f, root_child1.LayoutY);
            Assert.AreEqual(0f, root_child1.LayoutWidth);
            Assert.AreEqual(0f, root_child1.LayoutHeight);

            root.StyleDirection = YogaDirection.RTL;
            root.CalculateLayout();

            Assert.AreEqual(0f, root.LayoutX);
            Assert.AreEqual(0f, root.LayoutY);
            Assert.AreEqual(100f, root.LayoutWidth);
            Assert.AreEqual(100f, root.LayoutHeight);

            Assert.AreEqual(0f, root_child0.LayoutX);
            Assert.AreEqual(0f, root_child0.LayoutY);
            Assert.AreEqual(100f, root_child0.LayoutWidth);
            Assert.AreEqual(100f, root_child0.LayoutHeight);

            Assert.AreEqual(0f, root_child1.LayoutX);
            Assert.AreEqual(0f, root_child1.LayoutY);
            Assert.AreEqual(0f, root_child1.LayoutWidth);
            Assert.AreEqual(0f, root_child1.LayoutHeight);
        }

        [Test]
        public void Test_display_none_with_margin()
        {
            YogaConfig config = new YogaConfig();

            YogaNode root = new YogaNode(config);
            root.FlexDirection = YogaFlexDirection.Row;
            root.Width = 100;
            root.Height = 100;

            YogaNode root_child0 = new YogaNode(config);
            root_child0.MarginLeft = 10;
            root_child0.MarginTop = 10;
            root_child0.MarginRight = 10;
            root_child0.MarginBottom = 10;
            root_child0.Width = 20;
            root_child0.Height = 20;
            root_child0.Display = YogaDisplay.None;
            root.Insert(0, root_child0);

            YogaNode root_child1 = new YogaNode(config);
            root_child1.FlexGrow = 1;
            root.Insert(1, root_child1);
            root.StyleDirection = YogaDirection.LTR;
            root.CalculateLayout();

            Assert.AreEqual(0f, root.LayoutX);
            Assert.AreEqual(0f, root.LayoutY);
            Assert.AreEqual(100f, root.LayoutWidth);
            Assert.AreEqual(100f, root.LayoutHeight);

            Assert.AreEqual(0f, root_child0.LayoutX);
            Assert.AreEqual(0f, root_child0.LayoutY);
            Assert.AreEqual(0f, root_child0.LayoutWidth);
            Assert.AreEqual(0f, root_child0.LayoutHeight);

            Assert.AreEqual(0f, root_child1.LayoutX);
            Assert.AreEqual(0f, root_child1.LayoutY);
            Assert.AreEqual(100f, root_child1.LayoutWidth);
            Assert.AreEqual(100f, root_child1.LayoutHeight);

            root.StyleDirection = YogaDirection.RTL;
            root.CalculateLayout();

            Assert.AreEqual(0f, root.LayoutX);
            Assert.AreEqual(0f, root.LayoutY);
            Assert.AreEqual(100f, root.LayoutWidth);
            Assert.AreEqual(100f, root.LayoutHeight);

            Assert.AreEqual(0f, root_child0.LayoutX);
            Assert.AreEqual(0f, root_child0.LayoutY);
            Assert.AreEqual(0f, root_child0.LayoutWidth);
            Assert.AreEqual(0f, root_child0.LayoutHeight);

            Assert.AreEqual(0f, root_child1.LayoutX);
            Assert.AreEqual(0f, root_child1.LayoutY);
            Assert.AreEqual(100f, root_child1.LayoutWidth);
            Assert.AreEqual(100f, root_child1.LayoutHeight);
        }

        [Test]
        public void Test_display_none_with_child()
        {
            YogaConfig config = new YogaConfig();

            YogaNode root = new YogaNode(config);
            root.FlexDirection = YogaFlexDirection.Row;
            root.Width = 100;
            root.Height = 100;

            YogaNode root_child0 = new YogaNode(config);
            root_child0.FlexGrow = 1;
            root_child0.FlexShrink = 1;
            root_child0.FlexBasis = 0.Percent();
            root.Insert(0, root_child0);

            YogaNode root_child1 = new YogaNode(config);
            root_child1.FlexGrow = 1;
            root_child1.FlexShrink = 1;
            root_child1.FlexBasis = 0.Percent();
            root_child1.Display = YogaDisplay.None;
            root.Insert(1, root_child1);

            YogaNode root_child1_child0 = new YogaNode(config);
            root_child1_child0.FlexGrow = 1;
            root_child1_child0.FlexShrink = 1;
            root_child1_child0.FlexBasis = 0.Percent();
            root_child1_child0.Width = 20;
            root_child1.Insert(0, root_child1_child0);

            YogaNode root_child2 = new YogaNode(config);
            root_child2.FlexGrow = 1;
            root_child2.FlexShrink = 1;
            root_child2.FlexBasis = 0.Percent();
            root.Insert(2, root_child2);
            root.StyleDirection = YogaDirection.LTR;
            root.CalculateLayout();

            Assert.AreEqual(0f, root.LayoutX);
            Assert.AreEqual(0f, root.LayoutY);
            Assert.AreEqual(100f, root.LayoutWidth);
            Assert.AreEqual(100f, root.LayoutHeight);

            Assert.AreEqual(0f, root_child0.LayoutX);
            Assert.AreEqual(0f, root_child0.LayoutY);
            Assert.AreEqual(50f, root_child0.LayoutWidth);
            Assert.AreEqual(100f, root_child0.LayoutHeight);

            Assert.AreEqual(0f, root_child1.LayoutX);
            Assert.AreEqual(0f, root_child1.LayoutY);
            Assert.AreEqual(0f, root_child1.LayoutWidth);
            Assert.AreEqual(0f, root_child1.LayoutHeight);

            Assert.AreEqual(0f, root_child1_child0.LayoutX);
            Assert.AreEqual(0f, root_child1_child0.LayoutY);
            Assert.AreEqual(0f, root_child1_child0.LayoutWidth);
            Assert.AreEqual(0f, root_child1_child0.LayoutHeight);

            Assert.AreEqual(50f, root_child2.LayoutX);
            Assert.AreEqual(0f, root_child2.LayoutY);
            Assert.AreEqual(50f, root_child2.LayoutWidth);
            Assert.AreEqual(100f, root_child2.LayoutHeight);

            root.StyleDirection = YogaDirection.RTL;
            root.CalculateLayout();

            Assert.AreEqual(0f, root.LayoutX);
            Assert.AreEqual(0f, root.LayoutY);
            Assert.AreEqual(100f, root.LayoutWidth);
            Assert.AreEqual(100f, root.LayoutHeight);

            Assert.AreEqual(50f, root_child0.LayoutX);
            Assert.AreEqual(0f, root_child0.LayoutY);
            Assert.AreEqual(50f, root_child0.LayoutWidth);
            Assert.AreEqual(100f, root_child0.LayoutHeight);

            Assert.AreEqual(0f, root_child1.LayoutX);
            Assert.AreEqual(0f, root_child1.LayoutY);
            Assert.AreEqual(0f, root_child1.LayoutWidth);
            Assert.AreEqual(0f, root_child1.LayoutHeight);

            Assert.AreEqual(0f, root_child1_child0.LayoutX);
            Assert.AreEqual(0f, root_child1_child0.LayoutY);
            Assert.AreEqual(0f, root_child1_child0.LayoutWidth);
            Assert.AreEqual(0f, root_child1_child0.LayoutHeight);

            Assert.AreEqual(0f, root_child2.LayoutX);
            Assert.AreEqual(0f, root_child2.LayoutY);
            Assert.AreEqual(50f, root_child2.LayoutWidth);
            Assert.AreEqual(100f, root_child2.LayoutHeight);
        }

        [Test]
        public void Test_display_none_with_position()
        {
            YogaConfig config = new YogaConfig();

            YogaNode root = new YogaNode(config);
            root.FlexDirection = YogaFlexDirection.Row;
            root.Width = 100;
            root.Height = 100;

            YogaNode root_child0 = new YogaNode(config);
            root_child0.FlexGrow = 1;
            root.Insert(0, root_child0);

            YogaNode root_child1 = new YogaNode(config);
            root_child1.FlexGrow = 1;
            root_child1.Top = 10;
            root_child1.Display = YogaDisplay.None;
            root.Insert(1, root_child1);
            root.StyleDirection = YogaDirection.LTR;
            root.CalculateLayout();

            Assert.AreEqual(0f, root.LayoutX);
            Assert.AreEqual(0f, root.LayoutY);
            Assert.AreEqual(100f, root.LayoutWidth);
            Assert.AreEqual(100f, root.LayoutHeight);

            Assert.AreEqual(0f, root_child0.LayoutX);
            Assert.AreEqual(0f, root_child0.LayoutY);
            Assert.AreEqual(100f, root_child0.LayoutWidth);
            Assert.AreEqual(100f, root_child0.LayoutHeight);

            Assert.AreEqual(0f, root_child1.LayoutX);
            Assert.AreEqual(0f, root_child1.LayoutY);
            Assert.AreEqual(0f, root_child1.LayoutWidth);
            Assert.AreEqual(0f, root_child1.LayoutHeight);

            root.StyleDirection = YogaDirection.RTL;
            root.CalculateLayout();

            Assert.AreEqual(0f, root.LayoutX);
            Assert.AreEqual(0f, root.LayoutY);
            Assert.AreEqual(100f, root.LayoutWidth);
            Assert.AreEqual(100f, root.LayoutHeight);

            Assert.AreEqual(0f, root_child0.LayoutX);
            Assert.AreEqual(0f, root_child0.LayoutY);
            Assert.AreEqual(100f, root_child0.LayoutWidth);
            Assert.AreEqual(100f, root_child0.LayoutHeight);

            Assert.AreEqual(0f, root_child1.LayoutX);
            Assert.AreEqual(0f, root_child1.LayoutY);
            Assert.AreEqual(0f, root_child1.LayoutWidth);
            Assert.AreEqual(0f, root_child1.LayoutHeight);
        }

        [Test]
        public void Test_display_none_with_position_absolute()
        {
            YogaConfig config = new YogaConfig();

            YogaNode root = new YogaNode(config);
            root.Width = 100;
            root.Height = 100;

            YogaNode root_child0 = new YogaNode(config);
            root_child0.PositionType = YogaPositionType.Absolute;
            root_child0.Width = 100;
            root_child0.Height = 100;
            root_child0.Display = YogaDisplay.None;
            root.Insert(0, root_child0);
            root.StyleDirection = YogaDirection.LTR;
            root.CalculateLayout();

            Assert.AreEqual(0f, root.LayoutX);
            Assert.AreEqual(0f, root.LayoutY);
            Assert.AreEqual(100f, root.LayoutWidth);
            Assert.AreEqual(100f, root.LayoutHeight);

            Assert.AreEqual(0f, root_child0.LayoutX);
            Assert.AreEqual(0f, root_child0.LayoutY);
            Assert.AreEqual(0f, root_child0.LayoutWidth);
            Assert.AreEqual(0f, root_child0.LayoutHeight);

            root.StyleDirection = YogaDirection.RTL;
            root.CalculateLayout();

            Assert.AreEqual(0f, root.LayoutX);
            Assert.AreEqual(0f, root.LayoutY);
            Assert.AreEqual(100f, root.LayoutWidth);
            Assert.AreEqual(100f, root.LayoutHeight);

            Assert.AreEqual(0f, root_child0.LayoutX);
            Assert.AreEqual(0f, root_child0.LayoutY);
            Assert.AreEqual(0f, root_child0.LayoutWidth);
            Assert.AreEqual(0f, root_child0.LayoutHeight);
        }

    }
}
