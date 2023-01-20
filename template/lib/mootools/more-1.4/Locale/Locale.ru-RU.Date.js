(function(){var pluralize=function(n,one,few,many,other){var modulo10=n%10,modulo100=n%100;if(modulo10==1&&modulo100!=11){return one}else{if((modulo10==2||modulo10==3||modulo10==4)&&!(modulo100==12||modulo100==13||modulo100==14)){return few}else{if(modulo10==0||(modulo10==5||modulo10==6||modulo10==7||modulo10==8||modulo10==9)||(modulo100==11||modulo100==12||modulo100==13||modulo100==14)){return many}else{return other}}}};Locale.define("ru-RU","Date",{months:["Январь","Февраль","Март","Апрель","Май","Июнь","Июль","Август","Сентябрь","Октябрь","Ноябрь","Декабрь"],months_abbr:["янв","февр","март","апр","май","июнь","июль","авг","сент","окт","нояб","дек"],days:["Воскресенье","Понедельник","Вторник","Среда","Четверг","Пятница","Суббота"],days_abbr:["Вс","Пн","Вт","Ср","Чт","Пт","Сб"],dateOrder:["date","month","year"],shortDate:"%d.%m.%Y",shortTime:"%H:%M",AM:"AM",PM:"PM",firstDayOfWeek:1,ordinal:"",lessThanMinuteAgo:"меньше минуты назад",minuteAgo:"минуту назад",minutesAgo:function(delta){return"{delta} "+pluralize(delta,"минуту","минуты","минут")+" назад"},hourAgo:"час назад",hoursAgo:function(delta){return"{delta} "+pluralize(delta,"час","часа","часов")+" назад"},dayAgo:"вчера",daysAgo:function(delta){return"{delta} "+pluralize(delta,"день","дня","дней")+" назад"},weekAgo:"неделю назад",weeksAgo:function(delta){return"{delta} "+pluralize(delta,"неделя","недели","недель")+" назад"},monthAgo:"месяц назад",monthsAgo:function(delta){return"{delta} "+pluralize(delta,"месяц","месяца","месецев")+" назад"},yearAgo:"год назад",yearsAgo:function(delta){return"{delta} "+pluralize(delta,"год","года","лет")+" назад"},lessThanMinuteUntil:"меньше чем через минуту",minuteUntil:"через минуту",minutesUntil:function(delta){return"через {delta} "+pluralize(delta,"минуту","минуты","минут")+""},hourUntil:"через час",hoursUntil:function(delta){return"через {delta} "+pluralize(delta,"час","часа","часов")+""},dayUntil:"завтра",daysUntil:function(delta){return"через {delta} "+pluralize(delta,"день","дня","дней")+""},weekUntil:"через неделю",weeksUntil:function(delta){return"через {delta} "+pluralize(delta,"неделю","недели","недель")+""},monthUntil:"через месяц",monthsUntil:function(delta){return"через {delta} "+pluralize(delta,"месяц","месяца","месецев")+""},yearUntil:"через",yearsUntil:function(delta){return"через {delta} "+pluralize(delta,"год","года","лет")+""}});Locale.define("ru-RU-unicode").inherit("ru-RU","Date")})();