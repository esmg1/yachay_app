class Book {
  final String name;
  final String author;
  final String publishDate;
  final String ebookLink;
  final String amazonLink;
  final List<String> professors;

  Book({
    required this.name,
    required this.author,
    required this.publishDate,
    required this.ebookLink,
    required this.amazonLink,
    required this.professors,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      name: json['name'],
      author: json['author'],
      publishDate: json['publishDate'],
      ebookLink: json['ebookLink'],
      amazonLink: json['amazonLink'],
      professors: List<String>.from(json['professors']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'author': author,
      'publishDate': publishDate,
      'ebookLink': ebookLink,
      'amazonLink': amazonLink,
      'professors': professors,
    };
  }
}
