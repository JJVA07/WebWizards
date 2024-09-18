(function($) {

	var	$window = $(window),
		$head = $('head'),
		$body = $('body');

	// Breakpoints.
		breakpoints({
			xlarge:   [ '1281px',  '1680px' ],
			large:    [ '981px',   '1280px' ],
			medium:   [ '737px',   '980px'  ],
			small:    [ '481px',   '736px'  ],
			xsmall:   [ '361px',   '480px'  ],
			xxsmall:  [ null,      '360px'  ],
			'xlarge-to-max':    '(min-width: 1681px)',
			'small-to-xlarge':  '(min-width: 481px) and (max-width: 1680px)'
		});

	// Stops animations/transitions until the page has loaded.
	$window.on('load', function() {
		window.setTimeout(function() {
			$body.removeClass('is-preload');
		}, 100);
	});

	// Sidebar functionality.
	var $sidebar = $('#sidebar'),
		$sidebar_inner = $sidebar.children('.inner');

	// Inactive by default on <= large.
	breakpoints.on('<=large', function() {
		$sidebar.addClass('inactive');
	});

	breakpoints.on('>large', function() {
		$sidebar.removeClass('inactive');
	});

	// Toggle.
	$('<a href="#sidebar" class="toggle">Toggle</a>')
		.appendTo($sidebar)
		.on('click', function(event) {
			event.preventDefault();
			event.stopPropagation();
			$sidebar.toggleClass('inactive');
		});

	// Scroll lock.
	$window.on('load.sidebar-lock', function() {
		var sh, wh, st;
		if ($window.scrollTop() == 1)
			$window.scrollTop(0);

		$window
			.on('scroll.sidebar-lock', function() {
				var x, y;
				if (breakpoints.active('<=large')) {
					$sidebar_inner
						.data('locked', 0)
						.css('position', '')
						.css('top', '');
					return;
				}

				x = Math.max(sh - wh, 0);
				y = Math.max(0, $window.scrollTop() - x);

				if ($sidebar_inner.data('locked') == 1) {
					if (y <= 0)
						$sidebar_inner
							.data('locked', 0)
							.css('position', '')
							.css('top', '');
					else
						$sidebar_inner
							.css('top', -1 * x);
				}
				else {
					if (y > 0)
						$sidebar_inner
							.data('locked', 1)
							.css('position', 'fixed')
							.css('top', -1 * x);
				}
			})
			.on('resize.sidebar-lock', function() {
				wh = $window.height();
				sh = $sidebar_inner.outerHeight() + 30;
				$window.trigger('scroll.sidebar-lock');
			})
			.trigger('resize.sidebar-lock');
	});

	// Menu toggle.
	var $menu = $('#menu'),
		$menu_openers = $menu.children('ul').find('.opener');

	$menu_openers.each(function() {
		var $this = $(this);
		$this.on('click', function(event) {
			event.preventDefault();
			$menu_openers.not($this).removeClass('active');
			$this.toggleClass('active');
			$window.triggerHandler('resize.sidebar-lock');
		});
	});

})(jQuery);


// Alternating User and Notification dropdowns
document.getElementById('user-bell').addEventListener('click', function(event) {
    event.preventDefault();
    var userDropdown = document.getElementById('user-dropdown');
    var notificationDropdown = document.getElementById('notification-dropdown');

    // Close notification dropdown if open
    if (notificationDropdown.style.display === 'block') {
        notificationDropdown.style.display = 'none';
    }

    // Toggle user dropdown
    if (userDropdown.style.display === 'none' || userDropdown.style.display === '') {
        userDropdown.style.display = 'block';
    } else {
        userDropdown.style.display = 'none';
    }
});

document.getElementById('notification-bell').addEventListener('click', function(event) {
    event.preventDefault();
    var notificationDropdown = document.getElementById('notification-dropdown');
    var userDropdown = document.getElementById('user-dropdown');

    // Close user dropdown if open
    if (userDropdown.style.display === 'block') {
        userDropdown.style.display = 'none';
    }

    // Toggle notification dropdown
    if (notificationDropdown.style.display === 'none' || notificationDropdown.style.display === '') {
        notificationDropdown.style.display = 'block';
    } else {
        notificationDropdown.style.display = 'none';
    }
});

// Close dropdowns if clicked outside
window.addEventListener('click', function(event) {
    var userDropdown = document.getElementById('user-dropdown');
    var notificationDropdown = document.getElementById('notification-dropdown');
    var userBell = document.getElementById('user-bell');
    var notificationBell = document.getElementById('notification-bell');

    // Check if click is outside user dropdown
    if (!userDropdown.contains(event.target) && !userBell.contains(event.target)) {
        userDropdown.style.display = 'none';
    }

    // Check if click is outside notification dropdown
    if (!notificationDropdown.contains(event.target) && !notificationBell.contains(event.target)) {
        notificationDropdown.style.display = 'none';
    }
});

// Filter notifications by unread
document.getElementById('show-unread').addEventListener('click', function() {
    var items = document.querySelectorAll('.notification-item');
    items.forEach(function(item) {
        if (!item.classList.contains('unread')) {
            item.style.display = 'none';
        } else {
            item.style.display = 'block';
        }
    });
});

// Show all notifications
document.getElementById('show-all').addEventListener('click', function() {
    var items = document.querySelectorAll('.notification-item');
    items.forEach(function(item) {
        item.style.display = 'block';
    });
});
