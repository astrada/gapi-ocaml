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
           "2399953"
           blog.Blog.id;
         assert_equal
           "Blogger Buzz"
           blog.Blog.name)

let suite = "Blogger service test" >:::
  ["test_get_blog" >:: test_get_blog;
   ]


