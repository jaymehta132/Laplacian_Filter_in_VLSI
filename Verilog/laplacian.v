/* Make a Laplacian filter in Verilog
Input: 8-bit 16x16 grayscale image given serially in row-major order
Output: 8-bit 16x16 grayscale image given serially in row-major order

The Laplacian filter is a 3x3 filter with the following kernel:
0  1 0
1 -4 1
0  1 0

The output pixel is the sum of the product of the kernel and the input pixels centered at the output pixel.
The output pixel is clipped to 0-255.

The input is given using a SIPO shift register.
The output is given serially pixel by pixel

*/
module mux_21_8(input wire [7:0] a0, a1, input wire sel, output wire [7:0] y);

	assign y = ({8{sel}} & a1) | ({8{~sel}} & a0);

endmodule

module mux_21_11(input wire [10:0] a0, a1, input wire sel, output wire [10:0] y);

	assign y = ({11{sel}} & a1) | ({11{~sel}} & a0);

endmodule



module or_1(input wire a, b, output wire out);

    assign out = a | b;

endmodule

module pg_gen(input wire pin1, gin1, pin0, gin0, output wire pout, gout);

	assign pout = pin1 & pin0;
	assign gout = gin1 | (pin1 & gin0);

endmodule

module carry_gen(input wire cin, p, g, output wire cout);

	assign cout = g | (p & cin);
	
endmodule

module sum_gen(input wire p, cin, output wire s);

	assign s = p ^ cin;

endmodule

module ks11(input wire [10:0] a, b, output wire [10:0] y);
	genvar i;
	wire [10:0] p, g;
	generate
		for (i=0; i<11; i=i+1) begin : label
			assign p[i] = a[i] ^ b[i];
			assign g[i] = a[i] & b[i];
		end
	endgenerate
	
	wire p10_9, p9_8, p8_7, p7_6, p6_5, p5_4, p4_3, p3_2, p2_1, p1_0;
	wire g10_9, g9_8, g8_7, g7_6, g6_5, g5_4, g4_3, g3_2, g2_1, g1_0;
	
	pg_gen i1 (
		.pin1(p[10]),
		.gin1(g[10]),
		.pin0(p[9]),
		.gin0(g[9]),
		.pout(p10_9),
		.gout(g10_9));
		
	pg_gen i2 (
		.pin1(p[9]),
		.gin1(g[9]),
		.pin0(p[8]),
		.gin0(g[8]),
		.pout(p9_8),
		.gout(g9_8));
		
	pg_gen i3 (
		.pin1(p[8]),
		.gin1(g[8]),
		.pin0(p[7]),
		.gin0(g[7]),
		.pout(p8_7),
		.gout(g8_7));

	pg_gen i4 (
		.pin1(p[7]),
		.gin1(g[7]),
		.pin0(p[6]),
		.gin0(g[6]),
		.pout(p7_6),
		.gout(g7_6));

	pg_gen i5 (
		.pin1(p[6]),
		.gin1(g[6]),
		.pin0(p[5]),
		.gin0(g[5]),
		.pout(p6_5),
		.gout(g6_5));

		
	pg_gen i6 (
		.pin1(p[5]),
		.gin1(g[5]),
		.pin0(p[4]),
		.gin0(g[4]),
		.pout(p5_4),
		.gout(g5_4));

	pg_gen i7 (
		.pin1(p[4]),
		.gin1(g[4]),
		.pin0(p[3]),
		.gin0(g[3]),
		.pout(p4_3),
		.gout(g4_3));
		
	pg_gen i8 (
		.pin1(p[3]),
		.gin1(g[3]),
		.pin0(p[2]),
		.gin0(g[2]),
		.pout(p3_2),
		.gout(g3_2));
		
	pg_gen i9 (
		.pin1(p[2]),
		.gin1(g[2]),
		.pin0(p[1]),
		.gin0(g[1]),
		.pout(p2_1),
		.gout(g2_1));
		
	pg_gen i10 (
		.pin1(p[1]),
		.gin1(g[1]),
		.pin0(p[0]),
		.gin0(g[0]),
		.pout(p1_0),
		.gout(g1_0));




		

	wire p10_7, p9_6, p8_5, p7_4, p6_3, p5_2, p4_1, p3_0, p2_0;
	wire g10_7, g9_6, g8_5, g7_4, g6_3, g5_2, g4_1, g3_0, g2_0;

	pg_gen j1(
		.pin1(p10_9),
		.gin1(g10_9),
		.pin0(p8_7),
		.gin0(g8_7),
		.pout(p10_7),
		.gout(g10_7));

	pg_gen j2(
		.pin1(p9_8),
		.gin1(g9_8),
		.pin0(p7_6),
		.gin0(g7_6),
		.pout(p9_6),
		.gout(g9_6));

	pg_gen j3(
		.pin1(p8_7),
		.gin1(g8_7),
		.pin0(p6_5),
		.gin0(g6_5),
		.pout(p8_5),
		.gout(g8_5));

	pg_gen j4(
		.pin1(p7_6),
		.gin1(g7_6),
		.pin0(p5_4),
		.gin0(g5_4),
		.pout(p7_4),
		.gout(g7_4));

	pg_gen j5(
		.pin1(p6_5),
		.gin1(g6_5),
		.pin0(p4_3),
		.gin0(g4_3),
		.pout(p6_3),
		.gout(g6_3));

	pg_gen j6(
		.pin1(p5_4),
		.gin1(g5_4),
		.pin0(p3_2),
		.gin0(g3_2),
		.pout(p5_2),
		.gout(g5_2));

	pg_gen j7(
		.pin1(p4_3),
		.gin1(g4_3),
		.pin0(p2_1),
		.gin0(g2_1),
		.pout(p4_1),
		.gout(g4_1));

	pg_gen j8(
		.pin1(p3_2),
		.gin1(g3_2),
		.pin0(p1_0),
		.gin0(g1_0),
		.pout(p3_0),
		.gout(g3_0));
	
	pg_gen j9(
		.pin1(p2_1),
		.gin1(g2_1),
		.pin0(p[0]),
		.gin0(g[0]),
		.pout(p2_0),
		.gout(g2_0));

	
	
	
	
	wire p10_3, p9_2, p8_1, p7_0, p6_0, p5_0, p4_0;
	wire g10_3, g9_2, g8_1, g7_0, g6_0, g5_0, g4_0;
	
	pg_gen k1(
		.pin1(p10_7),
		.gin1(g10_7),
		.pin0(p6_3),
		.gin0(g6_3),
		.pout(p10_3),
		.gout(g10_3));

	pg_gen k2(
		.pin1(p9_6),
		.gin1(g9_6),
		.pin0(p5_2),
		.gin0(g5_2),
		.pout(p9_2),
		.gout(g9_2));

	pg_gen k3(
		.pin1(p8_5),
		.gin1(g8_5),
		.pin0(p4_1),
		.gin0(g4_1),
		.pout(p8_1),
		.gout(g8_1));

	pg_gen k4(
		.pin1(p7_4),
		.gin1(g7_4),
		.pin0(p3_0),
		.gin0(g3_0),
		.pout(p7_0),
		.gout(g7_0));
		
	pg_gen k5(
		.pin1(p6_3),
		.gin1(g6_3),
		.pin0(p2_0),
		.gin0(g2_0),
		.pout(p6_0),
		.gout(g6_0));
		
	pg_gen k6(
		.pin1(p5_2),
		.gin1(g5_2),
		.pin0(p1_0),
		.gin0(g1_0),
		.pout(p5_0),
		.gout(g5_0));
	
	pg_gen k7(
		.pin1(p4_1),
		.gin1(g4_1),
		.pin0(p[0]),
		.gin0(g[0]),
		.pout(p4_0),
		.gout(g4_0));
		
	
	
	wire p10_0, p9_0, p8_0;
	wire g10_0, g9_0, g8_0;
	
	pg_gen l1(
		.pin1(p10_3),
		.gin1(g10_3),
		.pin0(p2_0),
		.gin0(g2_0),
		.pout(p10_0),
		.gout(g10_0));
		
	pg_gen l2(
		.pin1(p9_2),
		.gin1(g9_2),
		.pin0(p1_0),
		.gin0(g1_0),
		.pout(p9_0),
		.gout(g9_0));
		
	pg_gen l3(
		.pin1(p8_1),
		.gin1(g8_1),
		.pin0(p[0]),
		.gin0(g[0]),
		.pout(p8_0),
		.gout(g8_0));
		
		

	wire [10:0] c, s;
	
	carry_gen m1(
		.cin(1'b0),
		.p(p10_0),
		.g(g10_0),
		.cout(c[10]));
		
    carry_gen m2(
        .cin(1'b0),
        .p(p9_0),
        .g(g9_0),
        .cout(c[9]));

    carry_gen m3(
        .cin(1'b0),
        .p(p8_0),
        .g(g8_0),
        .cout(c[8]));

    carry_gen m4(
        .cin(1'b0),
        .p(p7_0),
        .g(g7_0),
        .cout(c[7]));

    carry_gen m5(
        .cin(1'b0),
        .p(p6_0),
        .g(g6_0),
        .cout(c[6]));


    carry_gen m6(
        .cin(1'b0),
        .p(p5_0),
        .g(g5_0),
        .cout(c[5]));

    carry_gen m7(
        .cin(1'b0),
        .p(p4_0),
        .g(g4_0),
        .cout(c[4]));

    carry_gen m8(
        .cin(1'b0),
        .p(p3_0),
        .g(g3_0),
        .cout(c[3]));

    carry_gen m9(
        .cin(1'b0),
        .p(p2_0),
        .g(g2_0),
        .cout(c[2]));

    carry_gen m10(
        .cin(1'b0),
        .p(p1_0),
        .g(g1_0),
        .cout(c[1]));
    
    carry_gen m11(
        .cin(1'b0),
        .p(p[0]),
        .g(g[0]),
        .cout(c[0]));


    sum_gen n1(
        .p(p[10]),
        .cin(c[9]),
        .s(s[10]));

    sum_gen n2(
        .p(p[9]),
        .cin(c[8]),
        .s(s[9]));

    sum_gen n3(
        .p(p[8]),
        .cin(c[7]),
        .s(s[8]));

    sum_gen n4(
        .p(p[7]),
        .cin(c[6]),
        .s(s[7]));
  
    sum_gen n5(
        .p(p[6]),
        .cin(c[5]),
        .s(s[6]));
        
    sum_gen n6(
        .p(p[5]),
        .cin(c[4]),
        .s(s[5]));

    sum_gen n7(
        .p(p[4]),
        .cin(c[3]),
        .s(s[4]));
        
    sum_gen n8(
        .p(p[3]),
        .cin(c[2]),
        .s(s[3]));
        
    sum_gen n9(
        .p(p[2]),
        .cin(c[1]),
        .s(s[2]));

    sum_gen n10(
        .p(p[1]),
        .cin(c[0]),
        .s(s[1]));
        
    sum_gen n11(
        .p(p[0]),
        .cin(1'b0),
        .s(s[0]));

    assign y = s;

endmodule

module comp2(input wire [10:0] a, output wire[10:0] y);

	wire [10:0] cons;
	assign cons = 11'b00000000001;
 	ks11 add1 (
		.a(~a),
		.b(cons),
		.y(y));

endmodule

module laplacian(
    input CLK, // Clock
    input rst, // Reset
    input valid_in, // Input valid
    input [7:0] pixel_in, // Input pixel
    output reg valid_out, // Output valid
    output wire [7:0] pixel_out // Output pixel
);

reg [7:0] first_row[0:17]; // Shift register to store the input row
reg [7:0] second_row[0:17]; // Shift register to store the input row
reg [7:0] third_row[0:17]; // Shift register to store the input row

integer col_input; // Column number
integer col_operation; // Column number
integer i;
integer j;
integer valid_counter;
integer k;
wire[7:0] out_temp;

always @(posedge CLK or posedge rst) begin
    if (rst) begin
        for (i = 0; i < 18; i = i + 1) begin
            first_row[i] <= 0;
            second_row[i] <= 0;
            third_row[i] <= 0;
        end
		  valid_counter<=0;
		  k<=0;
        col_input <= 1;
        col_operation <= 17;
    end else if (valid_in) begin
		  valid_counter <= valid_counter + 1;
		  if(valid_counter>=16 & k<=255) begin
				valid_out<=1;
				k <= k + 1;
			end else begin
				valid_out<=0;
			end
        if (col_input == 1) begin
            for (j = 0; j < 18; j = j + 1) begin
                third_row[j] <= second_row[j];
                second_row[j] <= first_row[j];
            end
            first_row[col_input] <= pixel_in;
            col_input <= col_input + 1;
            col_operation <= 2;
        end else if (col_input < 16) begin
            first_row[col_input] <= pixel_in;
            col_input <= col_input + 1;
            col_operation <= col_operation + 1;
        end else if (col_input == 16) begin
            first_row[col_input] <= pixel_in;
            col_input <= 1;
            col_operation <= col_operation + 1;
        end
    end else begin
		if(k>=1) begin
			k<=k+1;
		end
		if(k>=256) begin
			valid_out<=0;
		end
	 end
	// pixel_out <= out_temp;

	 
end

assign pixel_out = out_temp & {8{~rst}};

mat_operation mat_op(
    .pixel_in_0_1(first_row[col_operation-1]),
    .pixel_in_1_0(second_row[col_operation-2]),
    .pixel_in_1_1(second_row[col_operation-1]),
    .pixel_in_1_2(second_row[col_operation]),
    .pixel_in_2_1(third_row[col_operation-1]),
    .pixel_out(out_temp)
);


endmodule

module mat_operation(
    input [7:0] pixel_in_0_1, // Input pixel
    input [7:0] pixel_in_1_0, // Input pixel
    input [7:0] pixel_in_1_1, // Input pixel
    input [7:0] pixel_in_1_2, // Input pixel
    input [7:0] pixel_in_2_1, // Input pixel
    output wire [7:0] pixel_out // Output pixel
);

wire [7:0] pixel_out_1_1;

wire [10:0] pixel_temp_0_1 = {1'b0, 1'b0, 1'b0, pixel_in_0_1};
wire [10:0] pixel_temp_1_0 = {1'b0, 1'b0, 1'b0, pixel_in_1_0};
wire [10:0] pixel_temp_1_1 = {1'b0, pixel_in_1_1, 1'b0, 1'b0};
wire [10:0] pixel_temp_1_2 = {1'b0, 1'b0, 1'b0, pixel_in_1_2};
wire [10:0] pixel_temp_2_1 = {1'b0, 1'b0, 1'b0, pixel_in_2_1};

wire [10:0] pixel_temp_1_1_not;
wire [10:0] pixel_temp_1;
wire [10:0] pixel_temp_2;
wire [10:0] pixel_temp_3;
wire [10:0] pixel_out_1_1_y;
wire [10:0] pixel_out_1_1_ynot;
wire [10:0] pixel_out_1_1_x;
wire mux2_sel;

comp2 two_comp1(
    .a(pixel_temp_1_1),
    .y(pixel_temp_1_1_not)
);

ks11 ks1(
    .a(pixel_temp_0_1),
    .b(pixel_temp_1_0),
    .y(pixel_temp_1)
);

ks11 ks2(
    .a(pixel_temp_1_2),
    .b(pixel_temp_2_1),
    .y(pixel_temp_2)
);

ks11 ks3(
    .a(pixel_temp_1),
    .b(pixel_temp_2),
    .y(pixel_temp_3)
);

ks11 ks4(
    .a(pixel_temp_3),
    .b(pixel_temp_1_1_not),
    .y(pixel_out_1_1_y)
);

comp2 two_comp2(
    .a(pixel_out_1_1_y),
    .y(pixel_out_1_1_ynot)
);

mux_21_11 mux1(
    .a0(pixel_out_1_1_y),
    .a1(pixel_out_1_1_ynot),
    .sel(pixel_out_1_1_y[10]),
    .y(pixel_out_1_1_x)
);

or_1 or1(
    .a(pixel_out_1_1_x[8]),
    .b(pixel_out_1_1_x[9]),
    .out(mux2_sel)
);

mux_21_8 mux2(
    .a0(pixel_out_1_1_x[7:0]),
    .a1(8'b11111111),
    .sel(mux2_sel),
    .y(pixel_out_1_1)
);

assign pixel_out = pixel_out_1_1[7:0];

endmodule
