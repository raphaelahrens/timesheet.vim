if exists("b:current_syntax")
    finish
endif

syntax keyword tsKeyword Mon Tue Wed Thu Fri Sat Sun

highlight link tsKeyword Keyword

syntax match tsDate "\v\d\d\.\d\d.\d\d\d\d"
syntax match tsTime "\v[^:0-9]\d\d:\d\d([^:]|$)"
syntax match tsTimeDiff "\v\d\{1,}:\d\d:\d\d"
syntax match tsTimeSaldo "\v-\{0,1}\d\d:\d\d"

highlight link tsDate String
highlight link tsTime Number
highlight link tsTimeDiff String
highlight link tsTimeSaldo String

syntax match tsOperator "\v--"
syntax match tsOperator "\v\|"
syntax match tsOperator "\v\=\>"
syntax match tsOperator "\v->"
syntax match tsOperator "\v✓"
syntax match tsOperator "\v\-\>"
syntax match tsOperator "\v\="

highlight link tsOperator Operator

let b:current_syntax = "timesheet"
