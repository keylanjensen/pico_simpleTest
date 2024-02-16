ruleset simple_test {
	meta {
		name "Simple Test"
		use module simple_module
	}
	
	rule test_get_posts {
		select when test get_all_posts
		pre {
			posts = simple_module:list_all_posts()
		}
		send_directive("say", {"something":posts})
	}
	
	rule test_get_post {
		select when test get_post
		pre {
			post = simple_module:get_post(event:attrs.get("postNumber"))
		}
		send_directive("say", {"something":post})
	}
	
	rule test_put_post {
		select when test put_post
		simple_module:create_post(event:attrs.get("post"))
	}
}