(* ::Package:: *)

(************************************************************************)
(* This file was generated automatically by the Mathematica front end.  *)
(* It contains Initialization cells from a Notebook file, which         *)
(* typically will have the same name as this file except ending in      *)
(* ".nb" instead of ".m".                                               *)
(*                                                                      *)
(* This file is intended to be loaded into the Mathematica kernel using *)
(* the package loading commands Get or Needs.  Doing so is equivalent   *)
(* to using the Evaluate Initialization Cells menu command in the front *)
(* end.                                                                 *)
(*                                                                      *)
(* DO NOT EDIT THIS FILE.  This entire file is regenerated              *)
(* automatically each time the parent Notebook file is saved in the     *)
(* Mathematica front end.  Any changes you make to this file will be    *)
(* overwritten.                                                         *)
(************************************************************************)



(* Title: ImportIO *) 
(* Author: Kristian Holsheimer *)
(* Summary: Summary goes here. *)
(* Context: ImportIO`IOCrawler` *)
(* Package version: 1.0 *)
(* History:  Version 1.0 September 24 2014 *)
(* Mathematica version: 10.0 for Linux x86 (64-bit) (June 29, 2014) *)
(* Discussion: Give more details here.*)


BeginPackage["ImportIO`"];

(* initialize: *)
Unprotect[IOCrawler];
ClearAll[IOCrawler];


(* messages: *)
IOCrawler::usage="ImportIO[call] calls an import.io API and returns the results in the form of an Association.";
IOCrawler::badkeys=
"The input call must be an Association object containing the following Keys: \"ID\", \"User\", \"APIKey\", \"URL\".";
IOCrawler::httperror=
"An error has occured: \"`1`\"";



(* syntax highlighting: *)
SyntaxInformation[ImportIO]={"ArgumentsPattern"->{_}};



(* start actual code: *)

Begin["`Private`"];

IOCrawler[call_Association]:=Module[{api,keys,request,response,output},

(* check if the necessary Keys are supplied (Abort otherwise): *)
keys={"ID","User","APIKey","URL"};
If[Not[SubsetQ[Keys[call],keys]],Message[IOCrawler::badkeys];Abort[]];


(* the full API URL: *)
api="https://api.import.io/store/connector/"<>call["ID"]<>"/_query?_user="<>call["User"]<>"&_apikey="<>call["APIKey"];


(* the request containing the URL to be scraped: *)
request="{\"input\":{\"webpage/url\":\""<>call["URL"]<>"\"}}";


(* do the crawling: *)
response=ImportString[URLFetch[api,"Method"->"POST","BodyData"->request],"JSON"]//Association;


(* initialize output: *)
output=Null;



(* test whether the request came back with an error: *)
If[KeyExistsQ[response,"error"]
,Message[IOCrawler::httperror,Lookup[response,"error"]]
];


(* test whether the request came back correctly: *)
If[KeyExistsQ[response,"results"]
,output=response["results"]//Association
];


(* the resulting output: *)
output
];


End[];


(* protect the functions thus defined: *)
Protect[IOCrawler];


EndPackage[];
