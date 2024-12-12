`timescale 1ns / 1ns

module main;
    reg CLK, RST_N;
    reg [7:0] pixel_in;
    wire [7:0] pixel_out;
    reg valid_in;
    wire valid_out;
    
    integer file, output_file, status;
    
    laplacian dut (.CLK(CLK), .rst(RST_N), .valid_in(valid_in), .pixel_in(pixel_in), .valid_out(valid_out), .pixel_out(pixel_out));

    always #10 CLK = ~CLK;
    
    initial begin
        CLK = 1'b0;  
        RST_N = 1'b1; 
        valid_in = 1'b0; 

        file = $fopen("/home/running_courses/EE671/EE671_40/OpenLane/designs/laplacian/verify/image7.txt", "r");  
       	output_file = $fopen("output_file.txt", "w");
                
        #25 RST_N = 1'b0;  
        valid_in = 1'b1;  
  
        while (!$feof(file)) begin
            status = $fscanf(file, "%d\n", pixel_in); 
            if (status > 0) begin
                #10;  
                $fdisplay(output_file, "%d %d", pixel_out, valid_out);
		//#20  
                $display("Time: %0t | %d  %d", $time, pixel_out, valid_out);  
            end
            #10;  
        end
	valid_in = 1'b0;
	#20
	$fdisplay(output_file, "%d %d", pixel_out, valid_out); 

        $fclose(file);
        $fclose(output_file);
        #20 $finish; 
    end

    initial begin
        $dumpfile("waveforms.vcd"); 
        $dumpvars(0, dut);
    end
endmodule
