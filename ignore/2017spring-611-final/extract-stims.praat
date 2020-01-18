form Where do you want to save the files?
comment Folder:
text folder /home/zined/Dropbox/umass/coursework/2017-611/final/
sentence save_sound_to_subfolder stims
sentence save_TextGrid_to_subfolder stims

positive labeltier 2
positive wordtier 3 
endform


exps$[1]="pragmatics"
exps$[2]="regular-focus"
exps$[3]="ec-focus"
exps$[4]="exp1a"
exps$[5]="exp1c"
exps$[6]="perception-ch1"
m=6

# Counter for number of files extracted, gets updated towards the end
l=1
for k from 1 to m
experiment$=exps$[k]
if k<4
	subject$="de"
	date$="20170316"
endif
if k>3
	subject$="ikb"
	date$="20170122"
endif
if k=6
	subject$="do"
	date$="20170531"
endif

# from the pragmatics subexperiment
if experiment$="pragmatics"
	labelToSave$[1]="limon-assert-1"
	labelToSave$[2]="limon-maybe-3"
	labelToSave$[3]="yalova-assert-1"
	labelToSave$[4]="yalova-maybe-1"
	labelToSave$[5]="anamur-assert-1"
	labelToSave$[6]="anamur-maybe-2"
	n=6
endif

if experiment$="regular-focus"
	labelToSave$[1]="ereglililer-prf-1"
	labelToSave$[2]="anamurlular-pmf-1"
	labelToSave$[3]="alanyalilar-vf-1"
	n=3
endif
if experiment$="ec-focus"
	labelToSave$[1]="alara-s-bil-2"
	labelToSave$[2]="manolya-s-bil-1"
	n=2
endif
if experiment$="exp1c"
	#test items:
	labelToSave$[1]="4-k-mv-a"
	labelToSave$[2]="4-k-ev-b"
	labelToSave$[3]="2-k-ev-a"
	labelToSave$[4]="2-k-mv-a"
	labelToSave$[5]="3-k-ev-a"
	labelToSave$[6]="3-k-mv-a"
	# fillers:
	labelToSave$[7]="8-k-do-b"
	labelToSave$[8]="9-k-do-b"
	n=8
endif
if experiment$="exp1a"
	# fillers
	labelToSave$[1]="1-w-pr-a"
	labelToSave$[2]="2-w-pm-a"
	labelToSave$[3]="3-w-v-a"
	n=3
endif
if experiment$="perception-ch1"
	labelToSave$[1]="ereglili-mv-2"
	labelToSave$[2]="ereglili-ev-2"
	labelToSave$[3]="emelhanim-mv-3"
	labelToSave$[4]="emelhanim-ev-2"
	labelToSave$[5]="angolali-mv-3"
	labelToSave$[6]="angolali-ev-1"
	labelToSave$[7]="cezeryeci-mv-4"
	labelToSave$[8]="cezeryeci-ev-2"
	labelToSave$[9]="canerabi-mv-2"
	labelToSave$[10]="canerabi-ev-2"
	labelToSave$[11]="ebruyenge-mv-2"
	labelToSave$[12]="ebruyenge-ev-3"
	labelToSave$[13]="aliamca-mv-5"
	labelToSave$[14]="aliamca-ev-2"
	labelToSave$[15]="esraabla-mv-4"
	labelToSave$[16]="esraabla-ev-2"
	labelToSave$[17]="ayse-2"
	labelToSave$[18]="bolumbaskan-2"
	n=18
endif

filename$=date$+"-"+subject$+"-"+experiment$
selectObject: "TextGrid 'filename$'"
tgpartname$=filename$+"_part"

numberOfIntervals=Get number of intervals... labeltier
appendInfoLine: labelToSave$[4]
for label from 1 to numberOfIntervals
	labelsToSave$=Get label of interval... labeltier label
	for i from 1 to n
	if labelsToSave$=labelToSave$[i]
#		appendInfoLine: i
		appendInfoLine: labelToSave$[i]
		intervalStart=Get starting point... labeltier label
		intervalEnd=Get end point... labeltier label
		Extract part... intervalStart intervalEnd Yes
		allWords=Get number of intervals... wordtier
		for word from 1 to allWords
			smaller$=Get label of interval... wordtier word 
			if smaller$="bil\i'yo" or smaller$="yol\u'yor" or smaller$="al\i'yor" or smaller$="ar\i'yor" or smaller$="denedi" or smaller$="elled\i'" or smaller$="doyurd\u'"
				smallerEnd=Get starting point... wordtier word
				# appendInfoLine: smallerEnd
				selectObject: "LongSound 'filename$'"
				soundpath$ = folder$ + save_sound_to_subfolder$ + "/" + string$(l) +subject$+experiment$+"-" + labelToSave$[i] + ".wav"
				appendInfoLine: soundpath$
				Extract part... intervalStart smallerEnd rectangular 1 No
				Write to WAV file... 'soundpath$'
				Remove
				selectObject: "TextGrid 'tgpartname$'"
			endif
		endfor
		Remove
		selectObject: "TextGrid 'filename$'"
		l=l+1
	endif
	endfor
endfor
endfor

