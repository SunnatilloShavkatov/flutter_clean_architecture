import 'package:flutter/material.dart';

import '../../../../../core/extension/extension.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/buttons/custom_button.dart';
import '../../../../../core/widgets/story/story.dart';

part 'mixin/story_mixin.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> with StoryMixin {
  late ValueNotifier<IndicatorAnimationCommand> indicatorAnimationController;

  @override
  void initState() {
    super.initState();
    indicatorAnimationController = ValueNotifier<IndicatorAnimationCommand>(
      IndicatorAnimationCommand.resume,
    );
  }

  @override
  void dispose() {
    indicatorAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StoryPageView(
          indicatorUnvisitedColor: context.color.whiteOpacity5,
          indicatorVisitedColor: context.colorScheme.primary,
          itemBuilder: (context, pageIndex, storyIndex) {
            final user = sampleUsers[pageIndex];
            final story = user.stories[storyIndex];
            return Stack(
              children: [
                Positioned.fill(
                  child: StoryImage(
                    key: ValueKey(story.imageUrl),
                    imageProvider: NetworkImage(
                      story.imageUrl,
                    ),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                const Positioned(
                  left: 16,
                  right: 16,
                  child: SafeArea(
                    minimum: EdgeInsets.only(top: 64),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Премьеры от SalomTV ✨',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Serjan Bratan',
                          style: TextStyle(
                            fontSize: 11,
                            color: Color.fromRGBO(255, 255, 255, 0.5),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
          gestureItemBuilder: (context, pageIndex, storyIndex) => Stack(
            children: [
              Positioned(
                right: 16,
                top: 0,
                child: SafeArea(
                  minimum: const EdgeInsets.only(top: 64),
                  child: Row(
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        style: const ButtonStyle(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        icon: const Icon(Icons.volume_up),
                        onPressed: () {},
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        style: const ButtonStyle(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SafeArea(
                  minimum: AppUtils.kPaddingAll16,
                  child: CustomButton(
                    label: const Text('Смотреть'),
                    onPressed: () async {
                      indicatorAnimationController.value =
                          IndicatorAnimationCommand.pause;
                      indicatorAnimationController.value =
                          IndicatorAnimationCommand.resume;
                    },
                  ),
                ),
              ),
            ],
          ),
          indicatorAnimationController: indicatorAnimationController,
          initialStoryIndex: (pageIndex) => 0,
          pageLength: sampleUsers.length,
          storyLength: (int pageIndex) => sampleUsers[pageIndex].stories.length,
          onPageLimitReached: () {
            Navigator.pop(context);
          },
        ),
      );
}
