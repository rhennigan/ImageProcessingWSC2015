(* Mathematica Package         *)
(* Created by IntelliJ IDEA    *)

(* :Title: ImageProcessingWSC2015     *)
(* :Context: ImageProcessingWSC2015`  *)
(* :Author: rhennigan            *)
(* :Date: 7/13/2015              *)

(* :Package Version: 1.0       *)
(* :Mathematica Version:       *)
(* :Copyright: (c) 2015 rhennigan *)
(* :Keywords:                  *)
(* :Discussion:                *)

BeginPackage["ImageProcessingWSC2015`"];
(* Exported symbols added here with SymbolName::usage *)

MagnifyImage::usage = "MagnifyImage[img, zoom] resizes \"img\" to \"zoom\" times its original dimensions";
CropToPlanet::usage = "CropToPlanet[img, pad] crops \"img\" to the bounding box of the first component with \"pad\"
 extra pixels of padding.";

Begin["`Private`"]; (* Begin Private Context *)

MagnifyImage[img_Image, z_] := With[{dim = ImageDimensions[img]}, ImageResize[img, z dim]];

CropToPlanet[img_Image, pad_] := Module[
  {extend, box},
  extend = {#1 - {pad, pad}, #2 + {pad, pad}} &;
  box = 1 /. ComponentMeasurements[img, "BoundingBox"];
  ImageTrim[img, extend @@ box]
];

End[]; (* End Private Context *)

Names["ImageProcessingWSC2015`*"]

EndPackage[];