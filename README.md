# matlab-dark-theme

DarkTheme class allows you to set a dark theme in MATLAB. 
This theme is a modified version of the "Oblivion" theme.
 
#####Usage:
```
 >>  d = DarkTheme
 >>  d.set
 ```
 Restart MATLAB for all changes to take effect

#####The following MATLAB preferences are updated:
   * Preferences > Colors
   * Preferences > Colors > Programming Tools
   * Preferences > Editor/Debugger > Language (Language: MATLAB)
   * Preferences > Editor/Debugger > Language (Language:XML/HTML)

Before updating the theme, it is recommended to make a copy of your
current MATLAB preferences (in case you need to restore). 
The preference file can be accessed at:
 ```
  >> fullfile(prefdir,'matlab.prf')
 ```
