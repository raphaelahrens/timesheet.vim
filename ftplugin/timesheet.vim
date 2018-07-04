if !exists("g:ts_calc_command")
    let timesheet_cmd = "timesheet "
    let g:ts_calc_command = timesheet_cmd . "calc"
    let g:ts_logout_command = timesheet_cmd . "logout"
    let g:ts_sum_command = timesheet_cmd . "sum"
    let g:ts_balance_command = timesheet_cmd . "balance"
    let g:ts_report_command = timesheet_cmd . "report"
endif

function! CalcTime(start_line, end_line)
    silent execute a:start_line . "," . a:end_line . "!" . g:ts_logout_command . "|" . g:ts_calc_command
endfunction

function! VCalcTime() range
    silent call CalcTime(a:firstline, a:lastline)
endfunction

function! SumTime(start_line, end_line)
    silent call CalcTime(a:start_line, a:end_line)
    silent execute a:start_line . "," . a:end_line . "!" . g:ts_sum_command
endfunction

function! VSumTime() range
    silent call SumTime(a:firstline, a:lastline)
endfunction

function! BalanceTime(start_line, end_line)
    silent execute a:start_line . "," . a:end_line . "!" . g:ts_balance_command
endfunction

function! VBalanceTime() range
    silent call BalanceTime(a:firstline, a:lastline)
endfunction

function! NCalcTime()
    let l = line(".")
    silent call CalcTime(l, l)
endfunction

nnoremap <CR> :call NCalcTime()<CR>
vnoremap <CR> :call VCalcTime()<CR>
vnoremap <Leader>s :call VSumTime()<CR>
vnoremap <Leader>b :call VBalanceTime()<CR>
