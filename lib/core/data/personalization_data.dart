enum QuestionType {
  singleChoice, // Radio button
  multipleChoice, // Checkbox
}

class QuestionOption {
  final String text;
  final String? imagePath; // Path to image asset or network URL

  QuestionOption({
    required this.text,
    this.imagePath,
  });
}

class PersonalizationQuestion {
  final String title;
  final List<String> options; // For backward compatibility
  final List<QuestionOption>? optionItems; // New: support for options with images
  final QuestionType type;

  PersonalizationQuestion({
    required this.title,
    List<String>? options,
    this.optionItems,
    this.type = QuestionType.singleChoice,
  }) : options = options ?? optionItems?.map((item) => item.text).toList() ?? [];

  // Helper to get option items (with images) or create from simple options
  List<QuestionOption> getOptionItems() {
    if (optionItems != null) {
      return optionItems!;
    }
    return options.map((text) => QuestionOption(text: text)).toList();
  }
}

class PersonalizationData {
  // Set pertanyaan pertama (2 pertanyaan, semua single choice)
  static final List<PersonalizationQuestion> questionOptions1 = [
    PersonalizationQuestion(
      title: 'Apakah kamu pernah mencoba menanam hidroponik sebelumnya?',
      options: [
        'Belum pernah',
        'Pernah, tapi masih pemula',
        'Sudah cukup berpengalaman',
      ],
      type: QuestionType.singleChoice,
    ),
    PersonalizationQuestion(
      title: 'Apa tujuan utama kamu menggunakan aplikasi HydropoMe?',
      options: [
        'Belajar hidroponik dari awal',
        'Merawat tanaman hidroponik yang sudah ada',
        'Membeli peralatan dan perlengkapan hidroponik',
        'Menjual hasil panen',
      ],
      type: QuestionType.singleChoice,
    ),
  ];

  // Set pertanyaan kedua (3 pertanyaan: 1 multiple choice, 2 single choice)
  static final List<PersonalizationQuestion> questionOptions2 = [
    PersonalizationQuestion(
      title: 'Jenis tanaman apa saja yang ingin kamu tanam?',
      options: [
        'Sayuran daun (misalnya selada, bayam)',
        'Buah (misalnya tomat, stroberi)',
        'Tanaman herbal',
        'Belum tahu / ingin rekomendasi',
      ],
      type: QuestionType.multipleChoice,
    ),
    PersonalizationQuestion(
      title: 'Berapa waktu yang bisa diluangkan per hari untuk merawat tanaman?',
      options: [
        '< 10 menit',
        '10-30 menit',
        '> 30 menit',
      ],
      type: QuestionType.singleChoice,
    ),
    PersonalizationQuestion(
      title: 'Di mana kamu akan menanam tanaman hidroponik?',
      options: [
        'Dalam ruangan',
        'Luar ruangan',
        'Balkon atau teras',
      ],
      type: QuestionType.singleChoice,
    ),
  ];

  // Set pertanyaan ketiga (1 pertanyaan dengan gambar di opsi)
  static final List<PersonalizationQuestion> questionOptions3 = [
    PersonalizationQuestion(
      title: 'Berapa luas area tanam yang kamu miliki?',
      optionItems: [
        QuestionOption(
          text: '< 1m²',
          imagePath: 'assets/image_luas_tanah.png', // You can add image path here
        ),
        QuestionOption(
          text: '1-3 m²',
          imagePath: 'assets/image_luas_tanah.png',
        ),
        QuestionOption(
          text: '> 3 m²',
          imagePath: 'assets/image_luas_tanah.png',
        ),
      ],
      type: QuestionType.singleChoice,
    ),
  ];
}

