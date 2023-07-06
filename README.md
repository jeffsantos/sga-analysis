# Moldable Analysis of the SGA System 

On [Pharo](https://pharo.org/) or [GlamorousToolki](https://gtoolkit.com/):

For development (with the seaside web app):

```smalltalk
Metacello new 
	repository: 'github://jeffsantos/sga-analysis:main/src';
	baseline: 'SGA';
	load 	
```

For analysis (without the webapp):

```smalltalk
Metacello new 
	repository: 'github://jeffsantos/sga-analysis:main/src';
	baseline: 'SGA';
	load: #('NonWeb' 'Analysis')
```
