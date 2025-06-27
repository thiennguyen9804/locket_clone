class CapturedImageData {
  final String imagePath;
  final String caption;
  final bool xFlip;

  const CapturedImageData({
    required this.imagePath,
    required this.caption,
    required this.xFlip,
  });

  /// Tạo bản sao với các field tùy chọn
  CapturedImageData copyWith({
    String? imagePath,
    String? caption,
    bool? xFlip,
  }) {
    return CapturedImageData(
      imagePath: imagePath ?? this.imagePath,
      caption: caption ?? this.caption,
      xFlip: xFlip ?? this.xFlip,
    );
  }

  /// So sánh value thay vì reference
  @override
  List<Object?> get props => [imagePath, caption, xFlip];

  /// JSON serialization
  Map<String, dynamic> toJson() => {
    'imagePath': imagePath,
    'caption': caption,
    'xFlip': xFlip,
  };

  factory CapturedImageData.fromJson(Map<String, dynamic> json) {
    return CapturedImageData(
      imagePath: json['imagePath'] as String,
      caption: json['caption'] as String,
      xFlip: json['xFlip'] as bool,
    );
  }

  @override
  String toString() =>
      'CapturedImageData(imagePath: $imagePath, caption: $caption, xFlip: $xFlip)';
}

class CapturedImageDataBuilder {
  String? _imagePath;
  String? _caption;
  bool? _xFlip;

  CapturedImageDataBuilder setImagePath(String imagePath) {
    _imagePath = imagePath;
    return this;
  }

  CapturedImageDataBuilder setCaption(String caption) {
    _caption = caption;
    return this;
  }

  CapturedImageDataBuilder setXFlip(bool xFlip) {
    _xFlip = xFlip;
    return this;
  }

  CapturedImageData build() {
    if (_imagePath == null || _caption == null || _xFlip == null) {
      throw StateError('Missing required fields');
    }

    return CapturedImageData(
      imagePath: _imagePath!,
      caption: _caption!,
      xFlip: _xFlip!,
    );
  }
}
