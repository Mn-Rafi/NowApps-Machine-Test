import '../../repositories/models/retailershopmodel.dart';

List<String> shopNames = [
  'Aditya Birla',
  'Jio',
  'Pepsi',
  'Reliance',
  'Sbi',
  'Tata',
  'Vodafone',
  'Wipro',
  'Xerox',
];

List<String> shopImages = [
  'https://m.economictimes.com/thumb/msid-58809115,width-1200,height-900,resizemode-4,imgsize-105448/aditya-birla-fashion-partners-kvic-to-sell-khadi-products.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Reliance_Jio_Logo_%28October_2015%29.svg/800px-Reliance_Jio_Logo_%28October_2015%29.svg.png',
  'https://i.pinimg.com/originals/73/96/df/7396df9a990795e91f0d515a0a4b3c1d.jpg',
  'https://storage.googleapis.com/5paisa-prod-storage/files/2022-02/Reliance%20Industries.jpg',
  'https://bfsi.eletsonline.com/wp-content/uploads/2020/01/SBI-Clerk-2020-Announcement.jpg',
  'https://d28wu8o6itv89t.cloudfront.net/images/BuTInTataTelecomjpg-1596437247509.jpeg',
  'https://telecomtalk.info/wp-content/uploads/2022/04/vodafone-idea-brings-five-new-prepaid-plans.png',
  'https://www.wipro.com/content/dam/nexus/germany-and-austria/wipro1-final.png',
  'https://st3.depositphotos.com/3047529/18272/i/600/depositphotos_182720736-stock-photo-dax-france-june-2017-xerox.jpg',
];

List<String> ownerNames = [
  'Aditya Birla',
  'Mukesh Ambani',
  'PepsiCo',
  'Ambani',
  'Government',
  'Ratan Tata',
  'Ravindra Takkar',
  'Azim Premji',
  'Joseph C.',
];

List<String> addressList = [
  'Mumbai',
  'Mumbai',
  'Mumbai',
  'Mumbai',
  'Mumbai',
  'Mumbai',
  'Mumbai',
  'Mumbai',
  'Mumbai',
];

List<String> mobileNumbers = [
  '9999999999',
  '9999999999',
  '9999999999',
  '9999999999',
  '9999999999',
  '9999999999',
  '9999999999',
  '9999999999',
  '9999999999',
];

List<RetailersModel> retailersList = [
  RetailersModel(imagePath: shopImages[0], name: shopNames[0], ownerName: ownerNames[0], address: addressList[0], phone: mobileNumbers[0]),
  RetailersModel(imagePath: shopImages[1], name: shopNames[1], ownerName: ownerNames[1], address: addressList[1], phone: mobileNumbers[1]),
  RetailersModel(imagePath: shopImages[2], name: shopNames[2], ownerName: ownerNames[2], address: addressList[2], phone: mobileNumbers[2]),
  RetailersModel(imagePath: shopImages[3], name: shopNames[3], ownerName: ownerNames[3], address: addressList[3], phone: mobileNumbers[3]),
  RetailersModel(imagePath: shopImages[4], name: shopNames[4], ownerName: ownerNames[4], address: addressList[4], phone: mobileNumbers[4]),
  RetailersModel(imagePath: shopImages[5], name: shopNames[5], ownerName: ownerNames[5], address: addressList[5], phone: mobileNumbers[5]),
  RetailersModel(imagePath: shopImages[6], name: shopNames[6], ownerName: ownerNames[6], address: addressList[6], phone: mobileNumbers[6]),
  RetailersModel(imagePath: shopImages[7], name: shopNames[7], ownerName: ownerNames[7], address: addressList[7], phone: mobileNumbers[7]),
  RetailersModel(imagePath: shopImages[8], name: shopNames[8], ownerName: ownerNames[8], address: addressList[8], phone: mobileNumbers[8]),
];

