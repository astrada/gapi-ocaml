open OUnit
open GapiUtils.Infix
open GapiBloggerV2Model
open GapiBloggerV2Service

let test_get_blog () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (blog, session) =
         BlogsResource.get
           ~blogId:"2399953"
           session
       in
         assert_equal
           "blogger#blog"
           blog.Blog.kind;
         assert_equal
           2399953L
           blog.Blog.id;
         assert_equal
           "Blogger Buzz"
           blog.Blog.name)

let test_get_comment () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (comment, session) =
         CommentsResource.get
           ~blogId:"2399953"
           ~postId:"5310628572012276714"
           ~commentId:"3631289146393899451"
           session
       in
         assert_equal
           "blogger#comment"
           comment.Comment.kind;
         assert_equal
           3631289146393899451L
           comment.Comment.id;
         assert_equal
           5310628572012276714L
           Comment.(comment.post.Post.id);
         assert_equal
           2399953L
           Comment.(comment.blog.Blog.id))

let test_list_comments () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (comments, session) =
         CommentsResource.list
           ~blogId:"2399953"
           ~postId:"5310628572012276714"
           session
       in
         assert_equal
           "blogger#commentList"
           comments.CommentList.kind;
         assert_bool
           "There should be at least 1 comment"
           (List.length comments.CommentList.items > 0))

let test_get_page () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (page, session) =
         PagesResource.get
           ~blogId:"2399953"
           ~pageId:"8251768148820290538"
           session
       in
         assert_equal
           "blogger#page"
           page.Page.kind;
         assert_equal
           8251768148820290538L
           page.Page.id;
         assert_equal
           2399953L
           Page.(page.blog.Blog.id))

let test_list_pages () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (pages, session) =
         PagesResource.list
           ~blogId:"2399953"
           session
       in
         assert_equal
           "blogger#pageList"
           pages.PageList.kind;
         assert_bool
           "There should be at least 1 page"
           (List.length pages.PageList.items > 0))

let test_get_post () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (post, session) =
         PostsResource.get
           ~blogId:"2399953"
           ~postId:"5310628572012276714"
           session
       in
         assert_equal
           "blogger#post"
           post.Post.kind;
         assert_equal
           5310628572012276714L
           post.Post.id;
         assert_equal
           2399953L
           Post.(post.blog.Blog.id))

let test_list_posts () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (posts, session) =
         PostsResource.list
           ~blogId:"2399953"
           session
       in
         assert_equal
           "blogger#postList"
           posts.PostList.kind;
         assert_bool
           "There should be at least 1 post"
           (List.length posts.PostList.items > 0))

let test_list_user_blogs () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (blogs, session) =
         UsersResource.Blogs.list
           ~userId:"self"
           session
       in
         assert_equal
           "blogger#blogList"
           blogs.BlogList.kind)

let test_get_user () =
  TestHelper.test_request
    TestHelper.build_oauth2_auth
    (fun session ->
       let (user, session) =
         UsersResource.get
           ~userId:"self"
           session
       in
         assert_equal
           "blogger#user"
           user.User.kind;
         TestHelper.assert_not_empty
           "User ID should not be empty"
           user.User.id)

let suite = "Blogger service test" >:::
  ["test_get_blog" >:: test_get_blog;
   "test_get_comment" >:: test_get_comment;
   "test_list_comments" >:: test_list_comments;
   "test_get_page" >:: test_get_page;
   "test_list_pages" >:: test_list_pages;
   "test_get_post" >:: test_get_post;
   "test_list_posts" >:: test_list_posts;
   "test_list_user_blogs" >:: test_list_user_blogs;
   "test_get_user" >:: test_get_user]

