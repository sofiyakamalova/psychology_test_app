import '../model/animation_model.dart';

class AnimationData {
  List<AnimationModel> items = [
    AnimationModel(
      title: 'Вперед!',
      text: 'Ты молодец! Продолжай в том же духе! 🚀',
      image: 'assets/images/go_ahead.png',
      btn_text: 'Продолжить',
    ),
    AnimationModel(
      title: 'Не сдавайся!',
      text:
          'Ты идешь прекрасно! Продолжай двигаться вперед. Твоя сила и упорство не знают границ. Ты можешь все, что захочешь!',
      image: 'assets/images/go_ahead2.png',
      btn_text: 'Продолжить',
    ),
    AnimationModel(
      title: 'Отличная работа!',
      text:
          ' Ты прошел тест и доказал, что твоя сила и упорство непревзойденны. Никогда не сомневайся в себе и своих способностях. Вперед, к новым вершинам!',
      image: 'assets/images/go_ahead3.png',
      btn_text: 'Посмотреть результаты',
    ),
  ];
}
