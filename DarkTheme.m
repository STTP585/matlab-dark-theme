classdef DarkTheme
% DARKTHEME Sets a dark theme in MATLAB. This theme is a modified version
% of the "Oblivion" theme.
% 
% Usage:
% >> d = DarkTheme
% >> d.set
% Restart MATLAB for all changes to take effect
%  
% The following MATLAB preferences are updated:
%   * Settings in Preferences > Colors
%   * Settings in Preferences > Colors > Programming Tools
%   * Settings in Preferences > Editor/Debugger > Language (Language: MATLAB)
%   * Settings in Preferences > Editor/Debugger > Language (Language:XML/HTML)
%
% Before updating the theme, it is recommended to make a copy of your
% current MATLAB preferences. The preference file can be accessed at:
% >> fullfile(prefdir,'matlab.prf')
%
% If you wish to revert to your original MATLAB color scheme, simply copy your 
% original prf file to prefdir and restart MATLAB.

   properties (Constant, Hidden)
       THEMEVERSION = '1.0';
   end
   
   properties
       %desktop tools
       ColorsUseSystem;
       ColorText;
       ColorBg;
       
       %syntax highlighting
       ColorKeyword;
       ColorComment;
       ColorString;
       ColorUnterminatedString;
       ColorError;
       ColorWarning;
       ColorMSystemCmds;
       ColorHTMLLinks;
       
       %code analyzer
       ColorUseAutoFixHighlight;
       ColorAutofixHighlight;
       
       %variable & function colors
       ColorUseAutoVarHighlight;
       ColorAutoVarHighlight;
       ColorUseNonLocalVarHighlight;
       ColorNonLocalVarHighlight;
       
       %xml
       ColorXMLTag;
       ColorXMLAttribute;
       ColorXMLValue;
       ColorXMLOperator;
       ColorXMLDocType;
       ColorXMLCDATA;
       ColorXMLProcInstr;
   end
   
   methods
       function obj = DarkTheme()
          % colors are based on modified Oblivion theme
          obj.ColorsUseSystem = false;
          obj.ColorText = [194, 194, 194]/256;
          obj.ColorBg = [39, 40, 34]/256;
          obj.ColorKeyword = [249, 38, 114]/256;
          obj.ColorComment = [117, 113, 94]/256;
          obj.ColorString = [230, 219, 116]/256;
          obj.ColorUnterminatedString = [255, 0, 0]/256;
          obj.ColorError = [255, 0, 0]/256;
          obj.ColorWarning = [255, 153, 0]/256;
          obj.ColorMSystemCmds = [0, 255, 0]/256;
          obj.ColorHTMLLinks = [0, 255, 255]/256;
          
          obj.ColorUseAutoFixHighlight = true;
          obj.ColorAutofixHighlight = [164, 0, 0]/256;
          
          obj.ColorUseAutoVarHighlight = true;
          obj.ColorAutoVarHighlight = [33, 72, 115]/256;
          obj.ColorUseNonLocalVarHighlight = true;
          obj.ColorNonLocalVarHighlight = [114, 159, 207]/256;
          
          obj.ColorXMLTag = [249, 38, 114]/256;
          obj.ColorXMLAttribute = [255, 0, 0]/256;
          obj.ColorXMLValue = [230, 219, 116]/256;
          obj.ColorXMLOperator = [0, 255, 0]/256;
          obj.ColorXMLDocType = [0, 255, 255]/256;
          obj.ColorXMLCDATA = [0, 185, 215]/256;
          obj.ColorXMLProcInstr = [0, 255, 255]/256;
       end
       
       function set(obj)
           error(javachk('awt'));
           setDesktopToolColors(obj);
           setMLSyntaxHighlightColors(obj);
           setCodeAnalyzerColors(obj);
           setVarHighlightColors(obj);
           setXMLColors(obj);
       end 
   end
   
   methods (Access = private)
       function setDesktopToolColors(obj)
           com.mathworks.services.Prefs.setBooleanPref('ColorsUseSystem',obj.ColorsUseSystem);
           if obj.ColorsUseSystem
               return;
           end
           com.mathworks.services.Prefs.setColorPref('ColorsText',...
               java.awt.Color(obj.ColorText(1), obj.ColorText(2), obj.ColorText(3)));
           com.mathworks.services.Prefs.setColorPref('ColorsBackground',...
               java.awt.Color(obj.ColorBg(1), obj.ColorBg(2), obj.ColorBg(3)));
       end
       
       function setMLSyntaxHighlightColors(obj)
           com.mathworks.services.Prefs.setColorPref('Colors_M_Keywords',...
               java.awt.Color(obj.ColorKeyword(1), obj.ColorKeyword(2), obj.ColorKeyword(3)));
           com.mathworks.services.Prefs.setColorPref('Colors_M_Comments',...
               java.awt.Color(obj.ColorComment(1), obj.ColorComment(2), obj.ColorComment(3)));
           com.mathworks.services.Prefs.setColorPref('Colors_M_Strings',...
               java.awt.Color(obj.ColorString(1), obj.ColorString(2),obj.ColorString(3)));
           com.mathworks.services.Prefs.setColorPref('Colors_M_UnterminatedStrings',...
               java.awt.Color(obj.ColorUnterminatedString(1), obj.ColorUnterminatedString(2), obj.ColorUnterminatedString(3)));
           com.mathworks.services.Prefs.setColorPref('Colors_M_Errors',...
               java.awt.Color(obj.ColorError(1), obj.ColorError(2), obj.ColorError(3)));
           com.mathworks.services.Prefs.setColorPref('Colors_M_Warnings',...
               java.awt.Color(obj.ColorWarning(1), obj.ColorWarning(2), obj.ColorWarning(3)));
           com.mathworks.services.Prefs.setColorPref('Colors_M_SystemCommands',...
               java.awt.Color(obj.ColorMSystemCmds(1), obj.ColorMSystemCmds(2), obj.ColorMSystemCmds(3)));
           com.mathworks.services.Prefs.setColorPref('Colors_HTML_HTMLLinks',...
               java.awt.Color(obj.ColorHTMLLinks(1), obj.ColorHTMLLinks(2), obj.ColorHTMLLinks(3)));
           
       end
       
       function setCodeAnalyzerColors(obj)
           com.mathworks.services.Prefs.setBooleanPref('ColorsUseMLintAutoFixBackground',obj.ColorUseAutoFixHighlight);
           com.mathworks.services.Prefs.setColorPref('ColorsMLintAutoFixBackground',...
               java.awt.Color(obj.ColorAutofixHighlight(1), obj.ColorAutofixHighlight(2), obj.ColorAutofixHighlight(3)));
       end
       
       function setVarHighlightColors(obj)
           com.mathworks.services.Prefs.setBooleanPref('Editor.VariableHighlighting.Automatic',obj.ColorUseAutoVarHighlight);
           com.mathworks.services.Prefs.setColorPref('Editor.VariableHighlighting.Color',...
               java.awt.Color(obj.ColorAutoVarHighlight(1),obj.ColorAutoVarHighlight(2),obj.ColorAutoVarHighlight(3)));
           
           com.mathworks.services.Prefs.setBooleanPref('Editor.NonlocalVariableHighlighting',obj.ColorUseAutoVarHighlight);
           com.mathworks.services.Prefs.setColorPref('Editor.NonlocalVariableHighlighting.TextColor',...
               java.awt.Color(obj.ColorNonLocalVarHighlight(1),obj.ColorNonLocalVarHighlight(2),obj.ColorNonLocalVarHighlight(3)));
       end
       
       function setXMLColors(obj)
           com.mathworks.services.Prefs.setColorPref('Editor.Language.XML.Color.tag',...
               java.awt.Color(obj.ColorXMLTag(1), obj.ColorXMLTag(2),obj.ColorXMLTag(3)));
           com.mathworks.services.Prefs.setColorPref('Editor.Language.XML.Color.attribute',...
               java.awt.Color(obj.ColorXMLAttribute(1), obj.ColorXMLAttribute(2),obj.ColorXMLAttribute(3)));
           com.mathworks.services.Prefs.setColorPref('Editor.Language.XML.Color.value',...
               java.awt.Color(obj.ColorXMLValue(1), obj.ColorXMLValue(2),obj.ColorXMLValue(3)));
           com.mathworks.services.Prefs.setColorPref('Editor.Language.XML.Color.operator',...
               java.awt.Color(obj.ColorXMLOperator(1), obj.ColorXMLOperator(2), obj.ColorXMLOperator(3)));           
           com.mathworks.services.Prefs.setColorPref('Editor.Language.XML.Color.comment',...
               java.awt.Color(obj.ColorComment(1), obj.ColorComment(2), obj.ColorComment(3)));
           com.mathworks.services.Prefs.setColorPref('Editor.Language.XML.Color.doctype',...
               java.awt.Color(obj.ColorXMLDocType(1), obj.ColorXMLDocType(2),obj.ColorXMLDocType(3)));
           com.mathworks.services.Prefs.setColorPref('Editor.Language.XML.Color.pi-content',...
               java.awt.Color(obj.ColorXMLProcInstr(1), obj.ColorXMLProcInstr(2),obj.ColorXMLProcInstr(3)));
           com.mathworks.services.Prefs.setColorPref('Editor.Language.XML.Color.cdata-section',...
               java.awt.Color(obj.ColorXMLCDATA(1), obj.ColorXMLCDATA(2),obj.ColorXMLCDATA(3)));
       end
   end
end