module ControllerSync (
  input clock, reset,
  output logic hSync,vSync,
  output logic [9:0] hCounter,
  output logic [9:0] vCounter,
  output logic vidOn, refreshDraw
  );
  
  initial
    begin
      hCounter = 0;
      vCounter = 0;
    end

  logic refreshHSync, refreshVSync;
  logic hVideoOn, vVideoOn;

  always @(posedge clock, posedge reset) begin 
      if(reset) begin
        hCounter <= 0;
      end else if(refreshHSync) begin
        hCounter <= 0;
      end else begin 
        hCounter <= hCounter + 1'b1;
      end
    end

  always @(posedge clock, posedge reset) begin 
      if(reset) begin
        vCounter <= 0;
      end else if(refreshVSync) begin
        vCounter <= 0;
      end else begin 
        if(hCounter == 793) begin
          vCounter <= vCounter + 1'b1;
        end else begin 
          vCounter <= vCounter;
        end
      end
    end

  assign hVideoOn = (hCounter < 635);
  assign vVideoOn = (vCounter < 480);
  assign hSync = ((hCounter < 650) || (hCounter > 745));
  assign vSync = ((vCounter < 490) || (vCounter > 492));

  assign refreshHSync = (hCounter == 793);
  assign refreshVSync = ((hCounter == 793) && (vCounter == 525));
  assign vidOn = (hVideoOn && vVideoOn);
  
  assign refreshDraw = ((hCounter == 635) & (vCounter == 480));
 
endmodule