import 'package:emoji_extension/emoji_extension.dart';
import 'package:emoji_extension/src/regex.dart';
import 'package:test/test.dart';

import '../../_tools/tools.dart';

void main() {
  group('Emojis', () {
    test('count returns correct value', () {
      expect(Emojis.count, 5042);
    });

    test('groups returns correct value', () {
      expect(Emojis.groups, Group.values);
    });

    test('subgroups returns correct value', () {
      expect(Emojis.subgroups, Subgroup.values);
    });

    test('versions returns correct value', () {
      expect(Emojis.versions, Version.values);
    });

    test('statuses returns correct value', () {
      expect(Emojis.statuses, Status.values);
    });

    test('colors returns correct value', () {
      expect(Emojis.colors, Color.values);
    });

    test('hairStyles returns correct value', () {
      expect(Emojis.hairStyles, HairStyle.values);
    });

    test('skinTones returns correct value', () {
      expect(Emojis.skinTones, SkinTone.values);
    });

    test('regex returns correct value', () {
      expect(Emojis.regex, Regex.emoji);
    });

    test('groupsWithSubgroups returns correct type', () {
      expect(Emojis.groupsWithSubgroups, isA<Map<Group, List<Subgroup>>>());
    });

    test('groupsWithSubgroupsValues returns correct type', () {
      expect(
        Emojis.groupsWithSubgroupsValues,
        isA<Map<String, List<String>>>(),
      );
    });

    test('shortcodePlatforms returns correct values', () {
      expect(
        Emojis.shortcodePlatforms,
        ['Default', 'CLDR', 'Discord', 'Github', 'Slack'],
      );
    });

    [
      '😀',
      'Grinning face',
      'grinning face',
      'Grinning Face',
      'Happy Face',
      'Happy face',
      'happy face',
      'Smiley Face',
      'Smiley face',
      'smiley face',
      '1F600',
      'grinning_face',
      ':grinning_face:',
      'grinning',
      ':grinning:',
    ].forEach((input) {
      test('getOne() returns correct value when param is: [$input]', () {
        expect(Emojis.getOne(input), TestEmojis.grinningFace);
      });
    });

    $({
      '😀': TestEmojis.grinningFace,
      'Grinning face': TestEmojis.grinningFace,
      'grinning face': TestEmojis.grinningFace,
      'Grinning Face': TestEmojis.grinningFace,
      'Happy face': TestEmojis.grinningFace,
      'happy face': TestEmojis.grinningFace,
      'Happy Face': TestEmojis.grinningFace,
      'Smiley face': TestEmojis.grinningFace,
      'smiley face': TestEmojis.grinningFace,
      'Smiley Face': TestEmojis.grinningFace,
      '1F600': TestEmojis.grinningFace,
      'grinning_face': TestEmojis.grinningFace,
      ':grinning_face:': TestEmojis.grinningFace,
      'grinning': TestEmojis.grinningFace,
      ':grinning:': TestEmojis.grinningFace,
      'some unknown value': null,
    }).forEach((input, expected) {
      test('getOneOrNull() returns $expected when param is: [$input]', () {
        expect(Emojis.getOneOrNull(input), expected);
      });
    });

    $({
      Group.smileysAndEmotion: 185,
      Group.peopleAndBody: 3291,
      Group.component: 9,
      Group.animalsAndNature: 161,
      Group.foodAndDrink: 138,
      Group.travelAndPlaces: 267,
      Group.activities: 96,
      Group.objects: 314,
      Group.symbols: 305,
      Group.flags: 276,
    }).forEach((input, expected) {
      test('byGroup() returns $expected emojis when group is: [${input.name}]',
          () {
        expect(Emojis.byGroup(input).length, expected);
      });
    });

    $({
      Subgroup.faceSmiling: 14,
      Subgroup.faceAffection: 10,
      Subgroup.faceTongue: 6,
      Subgroup.faceHand: 7,
      Subgroup.faceNeutralSkeptical: 19,
      Subgroup.faceSleepy: 6,
      Subgroup.faceUnwell: 12,
      Subgroup.faceHat: 3,
      Subgroup.faceGlasses: 3,
      Subgroup.faceConcerned: 27,
      Subgroup.faceNegative: 9,
      Subgroup.faceCostume: 8,
      Subgroup.catFace: 9,
      Subgroup.monkeyFace: 3,
      Subgroup.heart: 29,
      Subgroup.emotion: 20,
      Subgroup.handFingersOpen: 67,
      Subgroup.handFingersPartial: 55,
      Subgroup.handSingleFinger: 43,
      Subgroup.handFingersClosed: 36,
      Subgroup.hands: 62,
      Subgroup.handProp: 19,
      Subgroup.bodyParts: 49,
      Subgroup.person: 192,
      Subgroup.personGesture: 300,
      Subgroup.personRole: 635,
      Subgroup.personFantasy: 245,
      Subgroup.personActivity: 606,
      Subgroup.personSport: 395,
      Subgroup.personResting: 42,
      Subgroup.family: 533,
      Subgroup.personSymbol: 12,
      Subgroup.skinTone: 5,
      Subgroup.hairStyle: 4,
      Subgroup.animalMammal: 68,
      Subgroup.animalBird: 23,
      Subgroup.animalAmphibian: 1,
      Subgroup.animalReptile: 8,
      Subgroup.animalMarine: 12,
      Subgroup.animalBug: 18,
      Subgroup.plantFlower: 13,
      Subgroup.plantOther: 18,
      Subgroup.foodFruit: 20,
      Subgroup.foodVegetable: 20,
      Subgroup.foodPrepared: 34,
      Subgroup.foodAsian: 17,
      Subgroup.foodMarine: 5,
      Subgroup.foodSweet: 14,
      Subgroup.drink: 20,
      Subgroup.dishware: 8,
      Subgroup.placeMap: 8,
      Subgroup.placeGeographic: 16,
      Subgroup.placeBuilding: 32,
      Subgroup.placeReligious: 7,
      Subgroup.placeOther: 19,
      Subgroup.transportGround: 55,
      Subgroup.transportWater: 12,
      Subgroup.transportAir: 16,
      Subgroup.hotel: 3,
      Subgroup.time: 34,
      Subgroup.skyAndWeather: 65,
      Subgroup.event: 23,
      Subgroup.awardMedal: 7,
      Subgroup.sport: 28,
      Subgroup.game: 30,
      Subgroup.artsAndCrafts: 8,
      Subgroup.clothing: 50,
      Subgroup.sound: 9,
      Subgroup.music: 12,
      Subgroup.musicalInstrument: 12,
      Subgroup.phone: 7,
      Subgroup.computer: 19,
      Subgroup.lightAndVideo: 19,
      Subgroup.bookPaper: 19,
      Subgroup.money: 10,
      Subgroup.mail: 15,
      Subgroup.writing: 13,
      Subgroup.office: 31,
      Subgroup.lock: 7,
      Subgroup.tool: 38,
      Subgroup.science: 8,
      Subgroup.medical: 7,
      Subgroup.household: 27,
      Subgroup.otherObject: 11,
      Subgroup.transportSign: 13,
      Subgroup.warning: 16,
      Subgroup.arrow: 35,
      Subgroup.religion: 22,
      Subgroup.zodiac: 13,
      Subgroup.avSymbol: 34,
      Subgroup.gender: 6,
      Subgroup.math: 8,
      Subgroup.punctuation: 10,
      Subgroup.currency: 2,
      Subgroup.otherSymbol: 34,
      Subgroup.keycap: 25,
      Subgroup.alphanum: 49,
      Subgroup.geometric: 38,
      Subgroup.flag: 14,
      Subgroup.countryFlag: 259,
      Subgroup.subdivisionFlag: 3,
    }).forEach((input, expected) {
      test(
          'bySubgroup() returns $expected emojis when subgroup is: [${input.name}]',
          () {
        expect(Emojis.bySubgroup(input).length, expected);
      });
    });

    $({
      Version.v6_0: 793,
      Version.v7_0: 254,
      Version.v8_0: 809,
      Version.v9_0: 1187,
      Version.v10_0: 339,
      Version.v11_0: 188,
      Version.v12_0: 266,
      Version.v12_1: 186,
      Version.v13_0: 146,
      Version.v13_1: 422,
      Version.v14_0: 112,
      Version.v15_0: 31,
      Version.v15_1: 301,
      Version.v16_0: 8,
    }).forEach((input, expected) {
      test(
          'byVersion() returns $expected emojis when version is: [${input.name}]',
          () {
        expect(Emojis.byVersion(input).length, expected);
      });
    });

    $({
      Status.fullyQualified: 3781,
      Status.minimallyQualified: 1009,
      Status.unqualified: 243,
      Status.component: 9,
    }).forEach((input, expected) {
      test(
          'byStatus() returns $expected emojis when status is: [${input.name}]',
          () {
        expect(Emojis.byStatus(input).length, expected);
      });
    });

    $({
      Color.red: 69,
      Color.pink: 8,
      Color.orange: 11,
      Color.yellow: 10,
      Color.green: 14,
      Color.blue: 12,
      Color.lightBlue: 1,
      Color.purple: 7,
      Color.brown: 6,
      Color.black: 16,
      Color.grey: 2,
      Color.white: 91,
    }).forEach((input, expected) {
      test('byColor() returns $expected emojis when status is: [${input.name}]',
          () {
        expect(Emojis.byColor(input).length, expected);
      });
    });

    $({
      HairStyle.blond: 30,
      HairStyle.red: 19,
      HairStyle.curly: 19,
      HairStyle.white: 19,
      HairStyle.bald: 19,
    }).forEach((input, expected) {
      test(
          'byHairStyle() returns $expected emojis when status is: [${input.name}]',
          () {
        expect(Emojis.byHairStyle(input).length, expected);
      });
    });

    $({
      SkinTone.light: 547,
      SkinTone.mediumLight: 547,
      SkinTone.medium: 547,
      SkinTone.mediumDark: 547,
      SkinTone.dark: 547,
    }).forEach((input, expected) {
      test(
          'bySkinTone() returns $expected emojis when status is: [${input.name}]',
          () {
        expect(Emojis.bySkinTone(input).length, expected);
      });
    });

    test('all returns correct values', () {
      expect(Emojis.all.values, TestEmojis.values);
    });

    $({
      Emojis.smileysAndEmotion: 185,
      Emojis.peopleAndBody: 3291,
      Emojis.component: 9,
      Emojis.animalsAndNature: 161,
      Emojis.foodAndDrink: 138,
      Emojis.travelAndPlaces: 267,
      Emojis.activities: 96,
      Emojis.objects: 314,
      Emojis.symbols: 305,
      Emojis.flags: 276,
    }).forEach((input, expected) {
      test('returns $expected emojis', () {
        expect(input.length, expected);
      });
    });

    $({
      Emojis.faceSmiling: 14,
      Emojis.faceAffection: 10,
      Emojis.faceTongue: 6,
      Emojis.faceHand: 7,
      Emojis.faceNeutralSkeptical: 19,
      Emojis.faceSleepy: 6,
      Emojis.faceUnwell: 12,
      Emojis.faceHat: 3,
      Emojis.faceGlasses: 3,
      Emojis.faceConcerned: 27,
      Emojis.faceNegative: 9,
      Emojis.faceCostume: 8,
      Emojis.catFace: 9,
      Emojis.monkeyFace: 3,
      Emojis.heart: 29,
      Emojis.emotion: 20,
      Emojis.handFingersOpen: 67,
      Emojis.handFingersPartial: 55,
      Emojis.handSingleFinger: 43,
      Emojis.handFingersClosed: 36,
      Emojis.hands: 62,
      Emojis.handProp: 19,
      Emojis.bodyParts: 49,
      Emojis.person: 192,
      Emojis.personGesture: 300,
      Emojis.personRole: 635,
      Emojis.personFantasy: 245,
      Emojis.personActivity: 606,
      Emojis.personSport: 395,
      Emojis.personResting: 42,
      Emojis.family: 533,
      Emojis.personSymbol: 12,
      Emojis.skinTone: 5,
      Emojis.hairStyle: 4,
      Emojis.animalMammal: 68,
      Emojis.animalBird: 23,
      Emojis.animalAmphibian: 1,
      Emojis.animalReptile: 8,
      Emojis.animalMarine: 12,
      Emojis.animalBug: 18,
      Emojis.plantFlower: 13,
      Emojis.plantOther: 18,
      Emojis.foodFruit: 20,
      Emojis.foodVegetable: 20,
      Emojis.foodPrepared: 34,
      Emojis.foodAsian: 17,
      Emojis.foodMarine: 5,
      Emojis.foodSweet: 14,
      Emojis.drink: 20,
      Emojis.dishware: 8,
      Emojis.placeMap: 8,
      Emojis.placeGeographic: 16,
      Emojis.placeBuilding: 32,
      Emojis.placeReligious: 7,
      Emojis.placeOther: 19,
      Emojis.transportGround: 55,
      Emojis.transportWater: 12,
      Emojis.transportAir: 16,
      Emojis.hotel: 3,
      Emojis.time: 34,
      Emojis.skyAndWeather: 65,
      Emojis.event: 23,
      Emojis.awardMedal: 7,
      Emojis.sport: 28,
      Emojis.game: 30,
      Emojis.artsAndCrafts: 8,
      Emojis.clothing: 50,
      Emojis.sound: 9,
      Emojis.music: 12,
      Emojis.musicalInstrument: 12,
      Emojis.phone: 7,
      Emojis.computer: 19,
      Emojis.lightAndVideo: 19,
      Emojis.bookPaper: 19,
      Emojis.money: 10,
      Emojis.mail: 15,
      Emojis.writing: 13,
      Emojis.office: 31,
      Emojis.lock: 7,
      Emojis.tool: 38,
      Emojis.science: 8,
      Emojis.medical: 7,
      Emojis.household: 27,
      Emojis.otherObject: 11,
      Emojis.transportSign: 13,
      Emojis.warning: 16,
      Emojis.arrow: 35,
      Emojis.religion: 22,
      Emojis.zodiac: 13,
      Emojis.avSymbol: 34,
      Emojis.gender: 6,
      Emojis.math: 8,
      Emojis.punctuation: 10,
      Emojis.currency: 2,
      Emojis.otherSymbol: 34,
      Emojis.keycap: 25,
      Emojis.alphanum: 49,
      Emojis.geometric: 38,
      Emojis.flag: 14,
      Emojis.countryFlag: 259,
      Emojis.subdivisionFlag: 3,
    }).forEach((input, expected) {
      test('returns $expected emojis', () {
        expect(input.length, expected);
      });
    });

    $({
      Emojis.v6_0: 793,
      Emojis.v7_0: 254,
      Emojis.v8_0: 809,
      Emojis.v9_0: 1187,
      Emojis.v10_0: 339,
      Emojis.v11_0: 188,
      Emojis.v12_0: 266,
      Emojis.v12_1: 186,
      Emojis.v13_0: 146,
      Emojis.v13_1: 422,
      Emojis.v14_0: 112,
      Emojis.v15_0: 31,
      Emojis.v15_1: 301,
      Emojis.v16_0: 8,
    }).forEach((input, expected) {
      test('returns $expected emojis', () {
        expect(input.length, expected);
      });
    });

    $({
      Emojis.fullyQualified: 3781,
      Emojis.minimallyQualified: 1009,
      Emojis.unqualified: 243,
    }).forEach((input, expected) {
      test('returns $expected emojis', () {
        expect(input.length, expected);
      });
    });

    $({
      Emojis.red: 69,
      Emojis.pink: 8,
      Emojis.orange: 11,
      Emojis.yellow: 10,
      Emojis.green: 14,
      Emojis.blue: 12,
      Emojis.lightBlue: 1,
      Emojis.purple: 7,
      Emojis.brown: 6,
      Emojis.black: 16,
      Emojis.grey: 2,
      Emojis.white: 91,
    }).forEach((input, expected) {
      test('returns $expected emojis', () {
        expect(input.length, expected);
      });
    });

    $({
      Emojis.blondHairStyle: 30,
      Emojis.redHairStyle: 19,
      Emojis.curlyHairStyle: 19,
      Emojis.whiteHairStyle: 19,
      Emojis.baldHairStyle: 19,
    }).forEach((input, expected) {
      test('returns $expected emojis', () {
        expect(input.length, expected);
      });
    });

    $({
      Emojis.lightSkinTone: 547,
      Emojis.mediumLightSkinTone: 547,
      Emojis.mediumSkinTone: 547,
      Emojis.mediumDarkSkinTone: 547,
      Emojis.darkSkinTone: 547,
    }).forEach((input, expected) {
      test('returns $expected emojis', () {
        expect(input.length, expected);
      });
    });
  });
}
