<div class="view-topbar">
	<div class="topbar-console">
		<div class="tobar-head fl">
			<a href="/admin" class="topbar-logo fl"> <!-- <span><img src="Images/logo.png" width="20" height="20"/></span> -->
			</a> <a href="/admin" class="topbar-home-link topbar-btn text-center fl">
				<span>Management</span>
			</a>
		</div>
	</div>
	<div class="topbar-info">
		<ul class="fr">
			<li class="fl topbar-info-item">
				<div class="dropdown">
					<a href="#" class="topbar-btn">Welcome &nbsp; <sec:authentication property="name" /><span class="fl text-normal"></span>
						<span class="icon-arrow-down"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="/logout">LOGOUT</a></li>
					</ul>
				</div>
			</li>
		</ul>
	</div>
</div>