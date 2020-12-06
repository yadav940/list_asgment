import 'package:cached_network_image/cached_network_image.dart';
import 'package:coco_asg/screens/post_detail.dart';
import 'package:flutter/material.dart';
import 'package:coco_asg/config/palette.dart';
import 'package:coco_asg/models/models.dart';
import 'package:coco_asg/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:social_share/social_share.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: isDesktop ? 5.0 : 0.0,
      ),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          : null,
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => PostDetail(post)),);
        },
        child: Hero(
          tag: post.imageUrl!=null?post.imageUrl:'12',
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
                      PostHeader(post: post),
                      const SizedBox(height: 4.0),
                      Text(post.caption),
                      post.imageUrl != null
                          ? const SizedBox.shrink()
                          : const SizedBox(height: 6.0),
                    ],
                  ),
                ),
                post.imageUrl != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CachedNetworkImage(imageUrl: post.imageUrl),
                      )
                    : const SizedBox.shrink(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: PostStats(post: post),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PostHeader extends StatelessWidget {
  final Post post;

  const PostHeader({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} • ',
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
        ),
        IconButton(
          icon: const Icon(Icons.more_horiz),
          onPressed: () => print('More'),
        ),
      ],
    );
  }
}

class PostStats extends StatefulWidget {
  final Post post;

  const PostStats({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override
  PostStatsState createState() => PostStatsState();
}

class PostStatsState extends State<PostStats> {
  bool isLike=false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Palette.facebookBlue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.thumb_up,
                size: 10.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 4.0),
            Expanded(
              child: Text(
                '${widget.post.likes}',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
            Text(
              '${widget.post.comments} Comments',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(width: 8.0),
            Text(
              '${widget.post.shares} Shares',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            )
          ],
        ),
        const Divider(),
        Row(
          children: [
            PostButton(
              icon: Icon(
                MdiIcons.thumbUpOutline,
                color: isLike?Colors.indigoAccent:Colors.grey[600],
                size: 20.0,
              ),
              label: 'Like',
              //isSelected: isLike,
              onTap: (){
                setState(() {
                  if(isLike){
                    isLike=false;
                  }else{
                    isLike=true;
                  }

                });
              }/* => print('Like')*/,
            ),
            PostButton(
              icon: Icon(
                MdiIcons.commentOutline,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label: 'Comment',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PostDetail(widget.post)),);


              }/*=> print('Comment')*/,
            ),
            PostButton(
              icon: Icon(
                MdiIcons.shareOutline,
                color: Colors.grey[600],
                size: 25.0,
              ),
              label: 'Share',
              onTap: () {
                SocialShare.shareOptions("Hello world");
              }/*=> print('Share')*/,
            )
          ],
        ),
      ],
    );
  }
}

class PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function onTap;
  bool isSelected=false;

   PostButton({
    Key key,
    @required this.icon,
    @required this.label,
    @required this.onTap,
    this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            height: 25.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width: 4.0),
                Text(label,/*style: TextStyle(color: isSelected?Colors.indigoAccent:Colors.grey[600]),*/),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
