
SVG=\
	svg/cell1.svg \
	svg/cell2.svg \
	svg/robot_blue.svg \
	svg/robot_green.svg \
	svg/robot_red.svg \
	svg/robot_yellow.svg \
	svg/target_blue_circle.svg \
	svg/target_blue_octagon.svg \
	svg/target_blue_square.svg \
	svg/target_blue_triangle.svg \
	svg/target_green_circle.svg \
	svg/target_green_octagon.svg \
	svg/target_green_square.svg \
	svg/target_green_triangle.svg \
	svg/target_red_circle.svg \
	svg/target_red_octagon.svg \
	svg/target_red_square.svg \
	svg/target_red_triangle.svg \
	svg/target_whirl.svg \
	svg/target_yellow_circle.svg \
	svg/target_yellow_octagon.svg \
	svg/target_yellow_square.svg \
	svg/target_yellow_triangle.svg \
	svg/wall.svg \
	svg/robot_shadow.svg

client-svg.5c: $(SVG) svg/bin2cstring.5c
	rm -f $@
	nickle svg/bin2cstring.5c $(SVG) > $@

