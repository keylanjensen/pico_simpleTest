ruleset simple_module {
	meta {
		name "Simple Module"
		provides list_all_posts, get_post, create_post
		shares list_all_posts, get_post
	}
	
	global {
		list_all_posts = function() {
			http:get("https://jsonplaceholder.typicode.com/posts/")
		}
		get_post = function(post_num) {
			http:get("https://jsonplaceholder.typicode.com/posts/" + post_num)
		}
		create_post = defaction(givenPost) {
			http:post("https://jsonplaceholder.typicode.com/posts",
				body = givenPost
			)
		}
	}
}