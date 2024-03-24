import 'package:crime_management_system/constant-widgets/constant_appbar.dart';
import 'package:crime_management_system/constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecurityTipsView extends StatelessWidget {
  const SecurityTipsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const ConstantAppBar(text: 'Security Tips & Guidelines'),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.02, vertical: Get.height * 0.015),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'General Safety Tips:',
                  style: kHead3Black,
                ),
                Text(
                  '*Always be aware of your surroundings, whether you\'re in the busy streets of Blue Area or the serene parks of F-9 Park.',
                  style: kBody3Black,
                ),
                Text(
                  '*Avoid walking alone, especially in less populated areas or during late hours, and opt for well-lit and populated routes, such as the bustling streets of Jinnah Avenue',
                  style: kBody3Black,
                ),
                Text(
                  '*Keep your valuables secure, particularly in crowded places like Centaurus Mall or local markets such as Aabpara Market, where pickpocketing incidents may occur.',
                  style: kBody3Black,
                ),
                Text(
                  'Personal Safety:',
                  style: kHead3Black,
                ),
                Text(
                  '*While exploring Islamabad\'s scenic beauty, such as Daman-e-Koh or Margalla Hills National Park, walk confidently and maintain awareness of your surroundings, especially if hiking or trekking.',
                  style: kBody3Black,
                ),
                Text(
                  '*Trust your intuition and be cautious of strangers, particularly in tourist areas like Lok Virsa Museum or Rawal Lake View Park, where tourist attractions can attract unwanted attention.',
                  style: kBody3Black,
                ),
                Text(
                  'Home Security:',
                  style: kHead3Black,
                ),
                Text(
                  '*Ensure your home in sectors like F-6, F-7, and F-8 has sturdy locks on doors and windows, as these are prime residential areas.',
                  style: kBody3Black,
                ),
                Text(
                  '*Keep your home well-lit, particularly in neighborhoods like G-9 and G-10, and consider installing security cameras or alarm systems for added protection.',
                  style: kBody3Black,
                ),
                Text(
                  'Online Safety:',
                  style: kHead3Black,
                ),
                Text(
                  '*Use strong passwords and be cautious when sharing personal information online, especially on social media platforms like Facebook or Instagram, where privacy settings are crucial.',
                  style: kBody3Black,
                ),
                Text(
                  '*Public Wi-Fi networks in places like F-10 Markaz or F-11 Markaz may be convenient, but consider using a VPN for added security, especially when accessing sensitive information.',
                  style: kBody3Black,
                ),
                Text(
                  'Emergency Preparedness:',
                  style: kHead3Black,
                ),
                Text(
                  '*Islamabad is equipped with efficient emergency services, including the Rescue 1122 service, so familiarize yourself with emergency procedures and know how to contact emergency services if needed.',
                  style: kBody3Black,
                ),
                Text(
                  'Reporting Suspicious Activity:',
                  style: kHead3Black,
                ),
                Text(
                  '*If you notice any suspicious behavior or activities, particularly in sensitive areas like the Diplomatic Enclave or the Parliament House, report them to local law enforcement immediately and provide detailed descriptions to assist in investigations.',
                  style: kBody3Black,
                ),
                Text(
                  'Reporting Suspicious Activity:',
                  style: kHead3Black,
                ),
                Text(
                  '*If you notice any suspicious behavior or activities, particularly in sensitive areas like the Diplomatic Enclave or the Parliament House, report them to local law enforcement immediately and provide detailed descriptions to assist in investigations.',
                  style: kBody3Black,
                ),
                Text(
                  'Community Engagement:',
                  style: kHead3Black,
                ),
                Text(
                  '*Engage with your neighbors and participate in community crime prevention efforts, particularly in residential sectors like G-11 or I-8, to build a strong sense of community and enhance overall safety.',
                  style: kBody3Black,
                ),
                Text(
                  '*Stay informed about local crime prevention initiatives and community safety workshops, which are often held in community centers or local mosques, to stay proactive in crime prevention efforts.',
                  style: kBody3Black,
                ),
                Text(
                  'Traffic Safety:',
                  style: kHead3Black,
                ),
                Text(
                  '*Be mindful of traffic regulations and pedestrian crossings, particularly in busy areas like Blue Area or Jinnah Avenue, where traffic congestion and reckless driving may pose risks to pedestrians.',
                  style: kBody3Black,
                ),
                Text(
                  '*Use designated pedestrian walkways and overhead bridges, especially near busy intersections like Zero Point Interchange or Faizabad Flyover, to safely navigate through traffic.',
                  style: kBody3Black,
                ),
                Text(
                  'Public Transportation Safety:',
                  style: kHead3Black,
                ),
                Text(
                  '*Exercise caution when using public transportation, such as buses or taxis, especially during peak hours or late at night.',
                  style: kBody3Black,
                ),
                Text(
                  '*Choose well-known and reputable taxi services or ride-sharing apps for safer transportation options, particularly in areas like Faizabad or Faisal Avenue where public transport hubs are located.',
                  style: kBody3Black,
                ),
                Text(
                  'Tourist Safety:',
                  style: kHead3Black,
                ),
                Text(
                  '*If you\'re exploring popular tourist destinations in Islamabad, such as Pakistan Monument or Shakarparian Park, be vigilant of your surroundings and keep an eye on your belongings, especially in crowded areas.',
                  style: kBody3Black,
                ),
                Text(
                  '*Consider hiring a licensed tour guide or joining organized tours when visiting historical sites or natural attractions, such as Saidpur Village or Pir Sohawa, for a more secure and informative experience.',
                  style: kBody3Black,
                ),
                Text(
                  'Civic Responsibility:',
                  style: kHead3Black,
                ),
                Text(
                  '*Dispose of waste responsibly and help maintain cleanliness in public areas, parks, and streets, particularly in sectors like G-7 or G-8, to promote a cleaner and safer environment for all residents.',
                  style: kBody3Black,
                ),
                Text(
                  '*Report any instances of environmental degradation or illegal dumping to the local authorities, such as the Capital Development Authority (CDA), to ensure the preservation of Islamabad\'s natural beauty.',
                  style: kBody3Black,
                ),
                Text(
                  'Cultural Sensitivity:',
                  style: kHead3Black,
                ),
                Text(
                  '*Respect local customs and traditions when visiting religious sites, such as Faisal Mosque or Shah Faisal Masjid, by dressing modestly and adhering to appropriate behavior guidelines.',
                  style: kBody3Black,
                ),
                Text(
                  '*Be mindful of cultural sensitivities and avoid engaging in activities that may be deemed offensive or disrespectful to the local population, particularly in conservative neighborhoods like I-10 or I-11.',
                  style: kBody3Black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
