fun is_older(date1:int*int*int,date2:int*int*int) =
  ((#1 date1) > (#1 date2)) andalso ((#2 date1) > (#2 date2)) andalso ((#3 date1 > (#3 date2)))
									  

fun number_in_month(dateList : (int*int*int) list,month : int) =
      if null (dateList)
      then 0
      else  if #2 (hd dateList) = month
      then 1 + number_in_month(tl dateList,month)
      else number_in_month((tl dateList),month)
  
		
fun number_in_months(dateList : (int*int*int) list, monthList : int list) =
  if null (monthList)
  then 0
  else
      number_in_month(dateList,hd monthList) + number_in_months(dateList,tl monthList)
							       
fun dates_in_month(dateList : (int*int*int) list,month : int) =
      if null (tl dateList) andalso  #2 (hd dateList) = month
      then [hd dateList]
      else if null (tl dateList)
      then []
      else  if #2 (hd dateList) = month
      then (hd dateList) :: dates_in_month(tl dateList,month)
      else dates_in_month((tl dateList),month)

fun appendDates(dateList1 : (int*int*int) list,dateList2 : (int*int*int) list) =       if(null dateList1)							       then dateList2								       else
       appendDates(tl dateList1,(hd dateList1)::dateList2) 
       
								   		
fun dates_in_months(dateList : (int*int*int) list, monthList : int list) =
  if null (monthList)
  then []
  else
      appendDates(dates_in_month(dateList,hd monthList), dates_in_months(dateList,tl monthList))

fun get_nth(stringList : string list,n : int) =
  if n = 1
  then hd stringList
  else
      get_nth(tl stringList,n-1)

fun date_to_string(dateInput : int*int*int) =
  let val  monthList = ["January","February","March","April","May","June","July","August","September","October","November","December"]
      val  month = get_nth(monthList,(#2 dateInput)+1)
    in
	month^" "^Int.toString(#3 dateInput)^", "^Int.toString(#1 dateInput)
     end
						     
fun number_before_reaching_sum(sum:int,intList:int list) =
  if sum - hd intList <= 0
  then 0
  else
      1+number_before_reaching_sum(sum - hd intList,tl intList)

fun what_month(day:int) =
  let val daysList = [31,28,31,30,31,30,31,31,30,31,30,30];
  in
     1+ number_before_reaching_sum(day,daysList)
  end
  
fun month_range(day1:int,day2:int) =
      if day2 = day1
	  then [what_month(day2)]
      else
      what_month(day1) :: month_range(day1+1,day2)

