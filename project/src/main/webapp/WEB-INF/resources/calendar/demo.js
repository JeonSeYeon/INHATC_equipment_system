$(function()
{

	if (!window['console'])
	{
		window.console = {};
		window.console.log = function(){};
	}
		
	/*
	define a new language named "custom"
	*/

	$.dateRangePickerLanguages['custom'] = 
	{
		'selected': 'Choosed:',
		'days': 'Days',
		'apply': 'Close',
		'week-1' : 'Mon',
		'week-2' : 'Tue',
		'week-3' : 'Wed',
		'week-4' : 'Thu',
		'week-5' : 'Fri',
		'week-6' : 'Sat',
		'week-7' : 'Sun',
		'month-name': ['January','February','March','April','May','June','July','August','September','October','November','December'],
		'shortcuts' : 'Shortcuts',
		'past': 'Past',
		'7days' : '7days',
		'14days' : '14days',
		'30days' : '30days',
		'previous' : 'Previous',
		'prev-week' : 'Week',
		'prev-month' : 'Month',
		'prev-quarter' : 'Quarter',
		'prev-year' : 'Year',
		'less-than' : 'Date range should longer than %d days',
		'more-than' : 'Date range should less than %d days',
		'default-more' : 'Please select a date range longer than %d days',
		'default-less' : 'Please select a date range less than %d days',
		'default-range' : 'Please select a date range between %d and %d days',
		'default-default': 'This is costom language'
	};
	
	$('#date_range0').dateRangePicker(
	{
	}).bind('datepicker-first-date_selected', function(event, obj)
	{
		/* This event will be triggered when first date is selected */
		console.log('first-date_selected',obj);
		// obj will be something like this:
		// {
		// 		date1: (Date object of the earlier date)
		// }
	})
	.bind('datepicker-change',function(event,obj)
	{
		/* This event will be triggered when second date is selected */
		console.log('change',obj);
		// obj will be something like this:
		// {
		// 		date1: (Date object of the earlier date),
		// 		date2: (Date object of the later date),
		//	 	value: "2013-06-05 to 2013-06-07"
		// }
	})
	.bind('datepicker-apply',function(event,obj)
	{
		/* This event will be triggered when user clicks on the apply button */
		console.log('apply',obj);
	})
	.bind('datepicker-close',function()
	{
		/* This event will be triggered before date range picker close animation */
		console.log('before close');
	})
	.bind('datepicker-closed',function()
	{
		/* This event will be triggered after date range picker close animation */
		console.log('after close');
	})
	.bind('datepicker-open',function()
	{
		/* This event will be triggered before date range picker open animation */
		console.log('before open');
	})
	.bind('datepicker-opened',function()
	{
		/* This event will be triggered after date range picker open animation */
		console.log('after open');
	});



	$('#date_range1').dateRangePicker(
	{
		startOfWeek: 'monday',
    	separator : ' ~ ',
    	format: 'DD.MM.YYYY HH:mm',
    	autoClose: false,
		time: {
			enabled: true
		}
	});
	
	$('#date_range2').dateRangePicker();

	$('#date_range3').dateRangePicker(
	{
		language:'cn'
	});

	$('#date_range4').dateRangePicker(
	{
		language:'en'
	});

	$('#date_range105').dateRangePicker(
	{
		showCustomValues: true,
		customValueLabel: 'Dynamic Ranges',
		customValues:
		[
			{
				name: 'MTD',
				value: 'Month To Date'
			},
			{
				name: 'YTD',
				value: 'Year To Date'
			}
		]
	})

	$('#date_range100').dateRangePicker(
	{
		shortcuts : null,
		startOfWeek: 'sunday',
		language:'en',
		showShortcuts: true,
		customShortcuts: 
		[
			//if return an array of two dates, it will select the date range between the two dates
			{
				name: 'this week',
				dates : function()
				{
					var start = moment().day(0).toDate();
					var end = moment().day(6).toDate();
					// start.setDate(1);
					// end.setDate(30);
					return [start,end];
				}
			},
			//if only return an array of one date, it will display the month which containing the date. and it will not select any date range
			{
				name: 'Oct 2014',
				dates : function()
				{
					//move calendars to show this date's month and next month
					var movetodate = moment('2014-10','YYYY-MM').toDate();
					return [movetodate];
				}
			}
		]
	}).bind('datepicker-apply',function(event,obj)
	{
		console.log(obj);
	});

	$('#date_range101').dateRangePicker(
	{
		showShortcuts: true,	
		shortcuts : 
		{
			'next-days': [3,5,7],
			'next': ['week','month','year']
		}
	});

	$('#date_range102').dateRangePicker(
	{
		showShortcuts: true,
		shortcuts : 
		{
			'prev-days': [3,5,7],
			'prev': ['week','month','year'],
			'next-days':null,
			'next':null
		}
	});

	$('#date_range104').dateRangePicker(
	{
		showShortcuts:false
	});

	$('#date_range103').dateRangePicker(
	{
		autoClose: true
	});

	$('#date_range4-1').dateRangePicker(
	{
		language: 'custom'
	});

	$('#date_range5').dateRangePicker(
	{
		startDate: '2014-11-20'
	});

	$('#date_range6').dateRangePicker(
	{
		startDate: '2013-01-10',
		endDate: '2013-02-10'
	});

	$('#date_range7').dateRangePicker(
	{
		minDays: 3,
		maxDays: 7
	});

	$('#date_range8').dateRangePicker(
	{
		startOfWeek: 'monday'
	});

	$('#date_range9').dateRangePicker(
	{
		getValue: function()
		{
			return this.innerHTML;
		},
		setValue: function(s)
		{
			this.innerHTML = s;
		}
	});

	$('#two-inputs').dateRangePicker(
	{
		separator : ' to ',
		getValue: function()
		{
			if ($('#date_range200').val() && $('#date_range201').val() )
				return $('#date_range200').val() + ' to ' + $('#date_range201').val();
			else
				return '';
		},
		setValue: function(s,s1,s2)
		{
			$('#date_range200').val(s1);
			$('#date_range201').val(s2);
		}
	});

	$('#date_range10').dateRangePicker(
	{
		format: 'dddd MMM Do, YYYY'  //more formats at http://momentjs.com/docs/#/displaying/format/
	});

	$('#date_range11').dateRangePicker(
	{
		separator : ' ~ '
	}).bind('datepicker-change',function(e,r)
	{
		try
		{
			console.log(r);
		}catch(e){}
	});

	$('#date_range12').dateRangePicker(
	{
		inline:true,
		container: '#date_range12-container', 
		alwaysOpen:true 
	});

	$('#date_range13').dateRangePicker(
	{
		autoClose: true,
		singleDate : true,
		showShortcuts: false 
	});

	$('#date_range14').dateRangePicker(
	{
		batchMode: 'week',
		showShortcuts: false
	});

  $('#date_range14-2').dateRangePicker(
	{
		batchMode: 'week-range',
		showShortcuts: false
	});

	$('#date_range15').dateRangePicker(
	{
		showShortcuts: false,
		beforeShowDay: function(t)
		{
			var valid = !(t.getDay() == 0 || t.getDay() == 6);  //disable saturday and sunday
			var _class = '';
			var _tooltip = valid ? '' : 'weekends are disabled';
			return [valid,_class,_tooltip];
		}
	});

	$('#date_range16').dateRangePicker(
	{
		showShortcuts: false,
		format: 'YYYY-MM-DD'
	}).bind('datepicker-change', function(evt, obj) {
		alert('date1: ' + obj.date1 + ' / date2: ' + obj.date2);
	});

	$('#date_range16-open').click(function(evt)
	{
		evt.stopPropagation();
		$('#date_range16').data('dateRangePicker').open();
	});

	$('#date_range16-close').click(function(evt)
	{
		evt.stopPropagation();
		$('#date_range16').data('dateRangePicker').close();
	});

	$('#date_range16-set').click(function(evt)
	{
		evt.stopPropagation();
		$('#date_range16').data('dateRangePicker').setDateRange('2013-11-20','2014-08-25');
	});

	$('#date_range16-set-silent').click(function(evt)
	{
		evt.stopPropagation();
		$('#date_range16').data('dateRangePicker').setDateRange('2014-11-03','2015-02-12', true);
	});

	$('#date_range16-clear').click(function(evt)
	{
		evt.stopPropagation();
		$('#date_range16').data('dateRangePicker').clear();
	});

	$('#date_range16-destroy').click(function(evt)
	{
		evt.stopPropagation();
		$('#date_range16').data('dateRangePicker').destroy();
	});

	$('#date_range17').dateRangePicker(
	{
		stickyMonths: true,
		showShortcuts: false
	});

	$('#date_range18').dateRangePicker(
	{
		customTopBar: 'Foo Bar'
	});

	$('#date_range19').dateRangePicker(
	{
		extraClass: 'date_range-picker19'
	});

	$('#date_range20').dateRangePicker(
	{
		hoveringTooltip: false
	});

	$('#date_range21').dateRangePicker(
	{
		hoveringTooltip: function(days)
		{
			var D = ['','<span style="white-space:nowrap;">Please select another date</span>','Two', 'Three','Four','Five'];
			return D[days] ? D[days] : days+' days';
		}
	});

	$('#date_range22').dateRangePicker(
	{
		showDateFilter: function(time, date)
		{
			return '<div style="padding:0 5px;">\
						<span style="font-weight:bold">'+date+'</span>\
						<div style="opacity:0.3;">$'+Math.round(Math.random()*999)+'</div>\
					</div>';
		}
	});

	$('#date_range23').dateRangePicker(
	{
		singleMonth: true,
		showShortcuts: false,
		showTopbar: false
	});

	$('#date_range24').dateRangePicker(
	{
		showWeekNumbers: true
	});

	$('#date_range24-2').dateRangePicker(
	{
		showWeekNumbers: true,
		startOfWeek:'monday'
	});

	$('#date_range24-3').dateRangePicker(
	{
		showWeekNumbers: true,
		getWeekNumber: function(day)
		{
			var fiscalYearStart = moment('2015-08-16','YYYY-MM-DD');
			var daysOffset = parseInt(fiscalYearStart.format('DDD'),10);
			return moment(day).add( -1*daysOffset, 'days').format('W');
		}
	});

	$('#date_range25').dateRangePicker(
	{
		selectForward: true
	});

	$('#date_range26').dateRangePicker(
	{
		selectBackward: true
	});


});
