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

cropToPlanet::usage = "";

Begin["`Private`"]; (* Begin Private Context *)

magnify[img_Image, z_] := With[{dim = ImageDimensions[img]}, ImageResize[img, z dim]];

cropToPlanet[img_Image, pad_] := Module[
  {extend, box},
  extend = {#1 - {pad, pad}, #2 + {pad, pad}} &;
  box = 1 /. ComponentMeasurements[img, "BoundingBox"];
  ImageTrim[img, extend @@ box]
];

End[]; (* End Private Context *)

EndPackage[];