class TestModel {
  final String image;
  final String qwestion;
  final List<String> otvets;
  TestModel({
    required this.image,
    required this.qwestion,
    required this.otvets,
  });
}

List<TestModel> tests = [
  TestModel(
    image: 'https://i.ibb.co/KqQkWGr/1.png',
    qwestion: 'How does your skin react to a cleanser?',
    otvets: [
      'It becomes dry and tight.',
      'Normal, with no significant changes.',
      'It immediately becomes shiny and feels oily.',
    ],
  ),
  TestModel(
    image: 'https://i.ibb.co/hc0XQJS/2.png',
    qwestion: 'How does your skin react to climate changes?',
    otvets: [
      'It often flakes and becomes sensitive to the cold.',
      'It handles changes normally.',
      'It tends to get shiny and break out in hot weather.',
    ],
  ),
  TestModel(
    image: 'https://i.ibb.co/BVksrtN/3.png',
    qwestion: 'What is your pore type?',
    otvets: [
      'Small pores, often clogged.',
      'Moderate in size, with no specific issues.',
      'Large pores, often enlarged.',
    ],
  ),
  TestModel(
    image: 'https://i.ibb.co/mczV597/4.png',
    qwestion: 'How often do you need to moisturize your skin?',
    otvets: [
      'Every hour, as it is very dry.',
      'Morning and evening to maintain moisture.',
      'Rarely, as it quickly becomes oily.',
    ],
  ),
  TestModel(
    image: 'https://i.ibb.co/qMYPqnB/5.png',
    qwestion: 'Which parts of your face are sensitive or prone to irritation?',
    otvets: [
      'Cheeks and forehead.',
      'No specific problematic zones.',
      'Forehead, nose, and chin (T-zone).',
    ],
  ),
  TestModel(
    image: 'https://i.ibb.co/D91mR9r/6.png',
    qwestion: 'What is your attitude towards sunscreen?',
    otvets: [
      "It's crucial to use, as the skin easily burns.",
      'I use it occasionally.',
      'I rarely use it because the skin is not very sensitive to the sun.',
    ],
  ),
  TestModel(
    image: 'https://i.ibb.co/4gqn039/7.png',
    qwestion: 'How often do you experience acne or breakouts?',
    otvets: [
      'Regularly.',
      'Occasionally.',
      'Rarely, but they often occur in the T-zone.',
    ],
  ),
  TestModel(
    image: 'https://i.ibb.co/x3XKZFX/8.png',
    qwestion:
        'How do you assess the oil level in your skin throughout the day?',
    otvets: [
      'It becomes dry and tight during the day.',
      'Normal, with no noticeable changes.',
      'It quickly becomes oily during the day.',
    ],
  ),
  TestModel(
    image: 'https://i.ibb.co/CsdDvfG/9.png',
    qwestion: 'How does your skin react to wearing makeup?',
    otvets: [
      'Prone to flaking and irritation.',
      'Makeup stays well, no major issues.',
      'Quickly becomes shiny, and breakouts may occur.',
    ],
  ),
  TestModel(
    image: 'https://i.ibb.co/WvRxCKc/10.png',
    qwestion: 'How often do you experience redness or red spots?',
    otvets: [
      'Often.',
      'Occasionally.',
      'Rarely.',
    ],
  ),
  TestModel(
    image: 'https://i.ibb.co/QQP4DwJ/11.png',
    qwestion: 'What is your attitude towards skincare products?',
    otvets: [
      'I prefer rich and dense textures.',
      "I use a variety of products that don't cause excessive shine or dryness.",
      'Light and mattifying products suit me.',
    ],
  ),
  TestModel(
    image: 'https://i.ibb.co/MNDmvvW/12.png',
    qwestion: 'How long does your tan last after sun exposure?',
    otvets: [
      "It's difficult to tan, but the tan lasts a long time.",
      'The tan lasts for a while.',
      'I tan easily, but the tan fades quickly.',
    ],
  ),
];
