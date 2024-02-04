import 'dart:typed_data';

import 'package:aws_rekognition_api/rekognition-2016-06-27.dart' as rekognitionlibary;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AwsService {
  final rekognitionlibary.Rekognition rekognition;

  AwsService()
      : rekognition = rekognitionlibary.Rekognition(
          region: 'eu-central-1',
          credentials: rekognitionlibary.AwsClientCredentials(
            accessKey: dotenv.env['ACCESS_KEY']!,
            secretKey: dotenv.env['SECRET_KEY']!,
          ),
        );

  Future<rekognitionlibary.DetectFacesResponse> detectFaces(Uint8List imageBytes) async {
    try {
      final response = await rekognition.detectFaces(
        image: rekognitionlibary.Image(bytes: imageBytes),
        attributes: [rekognitionlibary.Attribute.all],
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
