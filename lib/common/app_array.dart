import 'models/HelpQuestionAndAnswer.dart';

class AppArray {

  //App details
  final appNameLogo = 'assets/image/app_name_logo.png';
  final appVersion = '1.1.0';

  //User contact link
  final contactNumber = '+94712345678';
  final contactEmail = 'abc@abc.abc';
  final websiteLink = 'https://www.google.com';


  // Login user data
  final userProfileImage = 'https://cdn.pixabay.com/photo/2018/05/04/12/21/man-3373868_640.jpg';
  final userName = 'Dulanka Sheshan';
  final userEmail = 'dulanka@gmail.com';
  final userId = '#Ref17464';
  final dailyCollectAmount = '15542.55';

  // List of collected users
  final List<Map<String, String>> collectedUsers = [
    {'name': 'Keells Super Market', 'amount': 'Rs.1000.45', 'image': 'https://logosandtypes.com/wp-content/uploads/2024/04/Keells.png'},
    {'name': 'Cargills Super Market', 'amount': 'Rs.2500', 'image': 'https://www.cargillsceylon.com/wp-content/uploads/2023/09/favicon-3.png'},
    {'name': 'Sathosa', 'amount': 'Rs.1500', 'image': 'https://island.lk/wp-content/uploads/2020/12/Lanka-Sathosa.jpg'},
    {'name': 'Sinhagiri', 'amount': 'Rs.1800', 'image': 'https://static-01.daraz.lk/other/shop/1f9c12e43b59508091329d78d7f10bdf.jpeg_200x200.jpg'},
    {'name': 'Arpico Super Centre', 'amount': 'Rs.1000', 'image': 'https://upload.wikimedia.org/wikipedia/en/0/03/Arpico_Supercenter_logo.png'},
    {'name': 'Singer', 'amount': 'Rs.1000', 'image': 'https://upload.wikimedia.org/wikipedia/en/thumb/7/77/Singer_Sri_Lanka_logo.jpg/220px-Singer_Sri_Lanka_logo.jpg'},
    {'name': 'Kamal Grocery Store', 'amount': 'Rs.2500.54', 'image': 'https://cdn.pixabay.com/photo/2020/10/01/17/11/store-5619201_640.jpg'},
    {'name': 'Grocery Store A', 'amount': 'Rs.1500', 'image': 'https://cdn.pixabay.com/photo/2018/01/25/08/14/beverages-3105631_640.jpg'},
    {'name': 'Grocery Store B', 'amount': 'Rs.1800', 'image': 'https://cdn.pixabay.com/photo/2024/07/23/07/12/market-8914276_640.jpg'},
  ];

  // Registered Clients
  final List<Map<String, String>> RegisteredClients = [
    {'name': 'Arpico Super Centre', 'address': 'Pettah', 'image': 'https://upload.wikimedia.org/wikipedia/en/0/03/Arpico_Supercenter_logo.png'},
    {'name': 'Singer Sri Lanka', 'address': 'Kandy', 'image': 'https://upload.wikimedia.org/wikipedia/en/thumb/7/77/Singer_Sri_Lanka_logo.jpg/220px-Singer_Sri_Lanka_logo.jpg'},
    {'name': 'Odel', 'address': 'Colombo 07', 'image': 'https://pbs.twimg.com/profile_images/980865257710133248/eZ2wY1g2_400x400.jpg'},
    {'name': 'Healthguard', 'address': 'Colombo 04', 'image': 'https://s3-us-west-2.amazonaws.com/cbi-image-service-prd/original/a0b6979e-fe11-495e-a656-12ec7e8643b7.png'},
    {'name': 'KFC Sri Lanka', 'address': 'Colombo 01', 'image': 'https://www.kfc.lk/images/logo.png'},
    {'name': 'Softlogic Mobile Center', 'address': 'Colombo 03', 'image': 'https://pbs.twimg.com/profile_images/1747153854272266240/LrD7Gflx_400x400.jpg'},
    {'name': 'Abans Electricals', 'address': 'Colombo 05', 'image': 'https://abansgroup.com/wp-content/uploads/2021/09/107983960_4005616912813387_644494594880947736_n.jpg'},
    {'name': 'Laugfs Supermarket', 'address': 'Colombo 08', 'image': 'https://upload.wikimedia.org/wikipedia/en/9/93/LAUGFS_Gas_logo.png'},
    {'name': 'Sarasavi Bookshop', 'address': 'Nugegoda', 'image': 'https://pbs.twimg.com/profile_images/609223432908111872/nkTlwWut_400x400.jpg'},
    {'name': 'Galle Face Hotel', 'address': 'Colombo 02', 'image': 'https://cdn.pixabay.com/photo/2013/04/18/14/39/ship-105596_640.jpg'},
    {'name': 'Cargills Food City', 'address': 'Battaramulla', 'image': 'https://www.cargillsceylon.com/wp-content/uploads/2023/09/favicon-3.png'},
    {'name': 'Keells Super', 'address': 'Dehiwala', 'image': 'https://logosandtypes.com/wp-content/uploads/2024/04/Keells.png'},
   {'name': 'Burger King Sri Lanka', 'address': 'Colombo 03', 'image': 'https://images.ctfassets.net/ih31w4gbf9hm/6zNwg4cQ6qIfhfEVJwQlBL/531538af566d1bb48ce4ce135892616c/burger-king-en.png'},
    {'name': 'Sampath Bank', 'address': 'Colombo 01', 'image': 'https://www.sampath.lk/api/uploads/About_us_3ebc8008e5_70f299bca5_2128367c03_dba86e0943_f7d8c2d10e_67e1327e5f.jpg'},
    {'name': 'Nations Trust Bank', 'address': 'Colombo 07', 'image': 'https://bmkltsly13vb.compat.objectstorage.ap-mumbai-1.oraclecloud.com/cdn.ft.lk/assets/uploads/image_c7f274939e.jpg'},
  ];

  //Notifications list
  final notifications = [
    {
      'notificationTitle': "Security",
      'notificationMessage': "Your password has been successfully changed.",
      'isRead': false,
      'time': DateTime.now().subtract(const Duration(minutes: 0)),
    },
    {
      'notificationTitle': "Update",
      'notificationMessage': "A new update is available.",
      'isRead': false,
      'time': DateTime.now().subtract(const Duration(hours: 2)),
    },
    {
      'notificationTitle': "Reminder",
      'notificationMessage': "Your appointment is coming up.",
      'isRead': true,
      'time': DateTime.now().subtract(const Duration(days: 1)),
    },
    {
      'notificationTitle': "Promotion",
      'notificationMessage': "Check out our latest promotion!",
      'isRead': true,
      'time': DateTime.now().subtract(const Duration(days: 5)),
    },
    {
      'notificationTitle': "Welcome",
      'notificationMessage': "Welcome to our service!",
      'isRead': true,
      'time': DateTime.now().subtract(const Duration(days: 8)),
    },
    {
      'notificationTitle': "Anniversary",
      'notificationMessage': "Happy 1-year anniversary with us!",
      'isRead': true,
      'time': DateTime.now().subtract(const Duration(days: 13)),
    },
    {
      'notificationTitle': "Security",
      'notificationMessage': "Your password has been successfully changed.Your password has been successfully changed.",
      'isRead': true,
      'time': DateTime.now().subtract(const Duration(days: 13)),
    },
    {
      'notificationTitle': "Update",
      'notificationMessage': "A new update is available.",
      'isRead': true,
      'time': DateTime.now().subtract(const Duration(days: 45)),
    },
    {
      'notificationTitle': "Reminder",
      'notificationMessage': "Your appointment is coming up.",
      'isRead': true,
      'time': DateTime.now().subtract(const Duration(days: 87)),
    },
    {
      'notificationTitle': "Promotion",
      'notificationMessage': "Check out our latest promotion!",
      'isRead': true,
      'time': DateTime.now().subtract(const Duration(days: 87)),
    },
    {
      'notificationTitle': "Welcome",
      'notificationMessage': "Welcome to our service!",
      'isRead': true,
      'time': DateTime.now().subtract(const Duration(days: 274)),
    },
    {
      'notificationTitle': "Anniversary",
      'notificationMessage': "Happy 1-year anniversary with us!",
      'isRead': true,
      'time': DateTime.now().subtract(const Duration(days: 365)),
    },
  ];



  //help page question and answers
  final List<HelpQuestionAndAnswer> helpQuestionsAndAnswers = [
    HelpQuestionAndAnswer(
      question: 'How do I create a new cache collection?',
      answer: 'To create a new cache collection: \n1. Open the Cache Collection App. \n2. Tap on the "New Collection" button. \n3. Enter a name and description for your collection. \n4. Optionally, add tags to categorize your collection. \n5. Tap "Create" to save your new cache collection.',
    ),
    HelpQuestionAndAnswer(
      question: 'How do I add a new cache item to my collection?',
      answer: 'To add a new cache item: \n1. Open the desired collection from the main screen. \n2. Tap the "Add Item" button. \n3. Fill in the item details such as name, location, and description. \n4. Optionally, upload a photo or document related to the item. \n5. Tap "Save" to add the item to your collection.',
    ),
    HelpQuestionAndAnswer(
      question: 'Can I share my cache collection with others?',
      answer: 'Yes, you can share your cache collection: \n1. Open the collection you want to share. \n2. Tap the "Share" button. \n3. Choose how you want to share the collection (e.g., via email, social media, or a direct link). \n4. Follow the prompts to complete the sharing process.',
    ),
    HelpQuestionAndAnswer(
      question: 'How do I search for a specific cache item?',
      answer: 'To search for a cache item: \n1. Go to the main screen or open a specific collection. \n2. Tap the search bar at the top. \n3. Enter keywords related to the item you are looking for. \n4. The app will display a list of matching items based on your search.',
    ),
    HelpQuestionAndAnswer(
      question: 'How do I delete a cache item from my collection?',
      answer: 'To delete a cache item: \n1. Open the collection that contains the item you want to delete. \n2. Locate the item and swipe left (or tap the delete icon). \n3. Confirm the deletion when prompted.',
    ),
    HelpQuestionAndAnswer(
      question: 'Can I back up my cache collections?',
      answer: 'Yes, you can back up your cache collections: 1. Go to the app settings. 2. Tap on "Backup & Restore." 3. Choose "Backup Now" to create a backup of your collections. 4. You can also enable automatic backups to ensure your data is always safe.',
    ),
  ];


}
