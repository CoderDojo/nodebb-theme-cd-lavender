<input type="hidden" template-variable="category_id" value="{cid}" />
<input type="hidden" template-variable="category_name" value="{name}" />
<input type="hidden" template-variable="category_slug" value="{slug}" />
<input type="hidden" template-variable="topic_count" value="{topic_count}" />
<input type="hidden" template-variable="currentPage" value="{currentPage}" />
<input type="hidden" template-variable="pageCount" value="{pageCount}" />

<div class="category row">
	<div class="col-md-9" no-widget-class="col-lg-12 col-sm-12" no-widget-target="sidebar">
		<!-- IMPORT partials/breadcrumbs.tpl -->
		<div class="subcategories row">
			<!-- BEGIN children -->
			<!-- IMPORT partials/category_child.tpl -->
			<!-- END children -->
		</div>

		<div class="header category-tools clearfix">
			<!-- IF privileges.topics:create -->
			<button id="new_topic" class="btn btn-primary">[[category:new_topic_button]]</button>
			<!-- ELSE -->
				<!-- IF !loggedIn -->
				<a href="{config.relative_path}/login" class="btn btn-primary">[[category:guest-login-post]]</a>
				<!-- ENDIF !loggedIn -->
			<!-- ENDIF privileges.topics:create -->

			<span class="pull-right">
				<!-- IF loggedIn -->
				<button type="button" class="btn btn-default btn-success watch <!-- IF !isIgnored -->hidden<!-- ENDIF !isIgnored -->">
					<i class="fa fa-eye"></i>
					<span class="visible-sm-inline visible-md-inline visible-lg-inline">[[category:watch]]</span>
				</button>
				<button type="button" class="btn btn-default btn-warning ignore <!-- IF isIgnored -->hidden<!-- ENDIF isIgnored -->">
					<i class="fa fa-eye-slash"></i>
					<span class="visible-sm-inline visible-md-inline visible-lg-inline">[[category:ignore]]</span>
				</button>
				<!-- ENDIF loggedIn -->

				<!-- IMPORT partials/category_tools.tpl -->

				<!-- IMPORT partials/category_sort.tpl -->

				<div class="dropdown share-dropdown inline-block">
					<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
						<span class="visible-sm-inline visible-md-inline visible-lg-inline">[[topic:share]]</span>
						<span class="visible-xs-inline"><i class="fa fa-fw fa-share-alt"></i></span>
						<span class="caret"></span>
					</button>

					<!-- IMPORT partials/share_dropdown.tpl -->
				</div>
			</span>
		</div>

		<!-- IF !topics.length -->
		<div class="alert alert-warning" id="category-no-topics">
			[[category:no_topics]]
		</div>
		<!-- ENDIF !topics.length -->

		<ul component="category" id="topics-container" itemscope itemtype="http://www.schema.org/ItemList" data-nextstart="{nextStart}">
			<meta itemprop="itemListOrder" content="descending">
			<!-- BEGIN topics -->
			<li component="category/topic" class="category-item {function.generateTopicClass}" data-tid="{topics.tid}" data-index="{topics.index}" data-cid="{topics.cid}" itemprop="itemListElement">

				<div class="category-body">
					<div class="row">
						<div class="col-md-8 col-sm-9">
							<!-- IF privileges.editable -->
								<i class="fa fa-fw fa-square-o pull-left select pointer"></i>
							<!-- ENDIF privileges.editable -->

							<div class="category-profile-pic">
								<a href="<!-- IF topics.user.userslug -->{config.relative_path}/user/{topics.user.userslug}<!-- ELSE -->#<!-- ENDIF topics.user.userslug -->">
									<!-- IF topics.thumb -->
									<img src="{topics.thumb}" alt="{topics.title}" class="profile-image user-img" title="{topics.title}">
									<!-- ELSE -->
									<img src="{topics.user.picture}" alt="{topics.user.username}" class="profile-image user-img" title="{topics.user.username}">
									<!-- ENDIF topics.thumb -->
								</a>
							</div>
							<div class="category-text">
								<p><strong><i component="topic/pinned" class="fa fa-thumb-tack<!-- IF !topics.pinned --> hide<!-- ENDIF !topics.pinned -->"></i> <i component="topic/locked" class="fa fa-lock<!-- IF !topics.locked --> hide<!-- ENDIF !topics.locked -->"></i></strong>
									<a component="topic/header" href="{config.relative_path}/topic/{topics.slug}" itemprop="url" class="topic-title">{topics.title}</a><br />
									<small>
									[[global:posted_ago, <span class="timeago" title="{topics.relativeTime}"></span>]]
									<!-- IF !topics.unreplied -->
									<span class="hidden-md hidden-lg">
									<br/>
									<a href="{config.relative_path}/topic/{topics.slug}/{topics.teaser.index}">[[global:replied_ago, <span class="timeago" title="{topics.teaser.timestamp}"></span>]]</a>
									</span>
									<!-- ENDIF !topics.unreplied -->
									<br/>
									<!-- IMPORT partials/category_tags.tpl -->
									</small>
								</p>
							</div>
						</div>
						<div class="col-xs-1 category-stat hidden-xs">
							<strong class="human-readable-number" title="{topics.postcount}">{topics.postcount}</strong><br />
							<small>[[global:posts]]</small>
						</div>
						<div class="col-xs-1 category-stat hidden-xs">
							<strong class="human-readable-number" title="{topics.viewcount}">{topics.viewcount}</strong><br />
							<small>[[global:views]]</small>
						</div>
						<div class="col-xs-2 category-stat replies hidden-sm hidden-xs">
							<!-- IF topics.unreplied -->
							<p class="no-replies">[[category:no_replies]]</p>
							<!-- ELSE -->
							<a href="<!-- IF topics.teaser.user.userslug -->{config.relative_path}/user/{topics.teaser.user.userslug}<!-- ELSE -->#<!-- ENDIF topics.teaser.user.userslug -->"><img class="profile-image small user-img" src="{topics.teaser.user.picture}" title="{topics.teaser.user.username}" /></a>
							<a href="{config.relative_path}/topic/{topics.slug}/{topics.teaser.index}">
								[[global:replied_ago, <span class="timeago" title="{topics.teaser.timestamp}"></span>]]
							</a>
							<!-- ENDIF topics.unreplied -->
						</div>
					</div>
				</div>

			</li>
			<!-- END topics -->
		</ul>
		<!-- IF config.usePagination -->
			<!-- IMPORT partials/paginator.tpl -->
		<!-- ENDIF config.usePagination -->
	</div>

	<div widget-area="sidebar" class="col-md-3 col-xs-12 category-sidebar"></div>
</div>

<!-- IMPORT partials/move_thread_modal.tpl -->
<!-- IMPORT partials/noscript/paginator.tpl -->
