import 'package:cached_network_image/cached_network_image.dart';
import 'package:coco_asg/models/post_model.dart';
import 'package:coco_asg/widgets/button_style_with_border.dart';
import 'package:coco_asg/widgets/post_container.dart';
import 'package:coco_asg/widgets/profile_avatar.dart';
import 'package:coco_asg/widgets/responsive.dart';
import 'package:coco_asg/widgets/tagrank_textfield_widget.dart';
import 'package:flutter/material.dart';
class PostDetail extends StatefulWidget {
  final Post post;

  PostDetail(this.post);

  @override
  _PostDetailState createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  TextEditingController searchTextEditingController=TextEditingController();
  FocusNode searchFocusNode=FocusNode();
  List<String> commentList=['Nice', 'Great'];



  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Hero(
        tag: widget.post.imageUrl,
        child: ListView(
          shrinkWrap: true,
          children: [

            //Text('klsld')
            Card(
              margin: EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: isDesktop ? 5.0 : 0.0,
              ),
              elevation: isDesktop ? 4.0 : 2.0,
              shape: isDesktop
                  ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
                  : null,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          PostHeader(post: widget.post),
                          const SizedBox(height: 4.0),
                          Text(widget.post.caption),
                          widget.post.imageUrl != null
                              ? const SizedBox.shrink()
                              : const SizedBox(height: 6.0),
                        ],
                      ),
                    ),
                    widget.post.imageUrl != null
                        ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CachedNetworkImage(imageUrl: widget.post.imageUrl),
                    )
                        : const SizedBox.shrink(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: PostStats(post: widget.post),
                    ),
                  ],
                ),
              ),
            ),

            ListView.builder(
              shrinkWrap: true,
              itemCount: commentList.length,
              scrollDirection: Axis.vertical,
              physics: const ScrollPhysics(),
              itemBuilder: (BuildContext ctxt, int index){
                return Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      ProfileAvatar(imageUrl: widget.post.user.imageUrl),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Column(
                          children: [
                            //PostHeader(post: widget.post),

                            Text(
                              widget.post.user.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Text(commentList[index])
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //PostHeader(post: widget.post),
                  /*const SizedBox(height: 4.0),
                  Text(widget.post.caption),
                  widget.post.imageUrl != null
                      ? const SizedBox.shrink()
                      : const SizedBox(height: 6.0),*/
              Row(
              children: [
              ProfileAvatar(imageUrl: widget.post.user.imageUrl),
              const SizedBox(width: 8.0),
                Flexible(
                  child: TagrankTexFieldWidget(
                    hintText: 'Write a comment... ',
                    textController: searchTextEditingController,
                    validationFunction: (str){return null;},
                    focusNode: searchFocusNode,
                    //maxLength: 3,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                  ),
                ),
              /*Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.post.user.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '${widget.post.timeAgo} • ',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12.0,
                          ),
                        ),
                        Icon(
                          Icons.public,
                          color: Colors.grey[600],
                          size: 12.0,
                        )
                      ],
                    ),
                  ],
                ),
              ),*/
              /*IconButton(
                icon: const Icon(Icons.more_horiz),
                onPressed: () => print('More'),
              ),*/

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ButtonStyleWithBorder(
                    callBack: (){
                      setState(() {
                        if(searchTextEditingController.text.isNotEmpty){
                          commentList.add(searchTextEditingController.text);
                          searchTextEditingController.text='';
                        }

                      });
                    },
                    buttonText: 'POST',
                    borderColor: Colors.black26,
                    textStyle: TextStyle(),
                  ),
                )
              ],
            )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
