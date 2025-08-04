import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:policy_vault_web/theme/colors.dart';
import 'package:policy_vault_web/widgets/dotted_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class PolicySection extends StatelessWidget {
  const PolicySection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;
    TextStyle style = Theme.of(context).textTheme.bodyLarge!.copyWith(
      height: 1.4,
      color: appColors.secondary,
      fontWeight: FontWeight.w500,
    );
    return SingleChildScrollView(
      child: SizedBox(
        width: width,
        child: Padding(
          padding: EdgeInsets.all(isMobile ? 12 : 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Privacy Policy',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: isMobile ? 30 : 50,
                    color: appColors.secondary,
                    decoration: TextDecoration.underline,
                    decorationColor: appColors.secondary,
                  ),
                ),
              ),
              SizedBox(height: isMobile ? 20 : 40),
              Text(
                'Overview',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: appColors.secondary,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Keewee Fintech Private Limited, (hereafter, Policy Vault) needs to gather, produce and use certain information that is confidential or private. The security of such information is important for Policy Vault, as per industry standard and regulatory requirements. This policy describes how this confidential and private data must be collected, handled and stored to meet Policy Vault data protection standards and to comply with the law.',
                style: style,
              ),
              const SizedBox(height: 16),
              Text(
                'Purpose',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: appColors.secondary,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              DottedBullet(
                text:
                    "Policy Vault takes the privacy and security of all information including customers, employees, contractors, consultants, partners or other agents of Policy Vault very seriously and has adopted security measures both within the physical environment in which all information is stored and within the applications to ensure that the customer's information is protected.",
              ),
              DottedBullet(text: "Objective of the policy is to."),
              DottedBullet(
                text:
                    "To protect data / information that is confidential or private.",
              ),
              DottedBullet(
                text:
                    "o ensure effective procedures are in place to prevent loss of confidential and private information.",
              ),

              const SizedBox(height: 16),
              Text(
                'Scope',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: appColors.secondary,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text('The policy applies to:', style: style),
              const SizedBox(height: 16),
              DottedBullet(text: "Policy Vault offices in all the locations."),
              DottedBullet(text: "All employees of Policy Vault."),
              DottedBullet(
                text:
                    "All contractors, suppliers and other people working on behalf of Policy Vault.",
              ),
              const SizedBox(height: 16),
              Text(
                'Policy Review, Revision and Communication',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: appColors.secondary,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'This policy shall be reviewed and updated once every year to incorporate relevant changes. All subsequent updates to the policy shall be communicated over E-mail and made available on the intranet to all the employees by the end of March every year.',
                style: style,
              ),
              const SizedBox(height: 16),
              Text(
                'Sensitive Personal Data',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: appColors.secondary,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Sensitive personal data or information of a person means such personal information which consists of information related to:',
                style: style,
              ),
              const SizedBox(height: 16),
              DottedBullet(text: "Password."),
              DottedBullet(
                text:
                    "Financial information such as bank account, credit card/ debit card or other payment instrument details.",
              ),
              DottedBullet(
                text: "Physical, physiological and mental health condition.",
              ),
              DottedBullet(text: "Sexual orientation."),
              DottedBullet(text: "Medical records and history."),
              DottedBullet(text: "Biometric information."),
              DottedBullet(
                text: "Social Security / Unique Identification Numbers.",
              ),
              DottedBullet(text: "Location Information."),
              DottedBullet(text: "Political Affiliation."),
              const SizedBox(height: 16),
              Text(
                'Data Protection Principles',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: appColors.secondary,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Policy Vault will discharge its responsibilities in accordance with the requisite legal compliances (law of the land) and the following data protection principles contained therein:',
                style: style,
              ),
              const SizedBox(height: 16),
              DottedBullet(text: "Obtain and process information fairly."),
              DottedBullet(
                text:
                    "Keep it only for one or more specified, explicit and lawful purposes.",
              ),
              DottedBullet(
                text:
                    "Use and disclose it only in ways as mentioned in this document.",
              ),
              DottedBullet(text: "Keep it safe and secure."),
              DottedBullet(
                text: "Keep it accurate, complete and up- to- date.",
              ),
              DottedBullet(
                text: "Ensure it is adequate, relevant and not excessive.",
              ),
              DottedBullet(text: "Retain for no longer than is necessary."),
              DottedBullet(text: "Location Information."),
              DottedBullet(
                text:
                    "Give a copy of personal data to the individual upon request.",
              ),
              const SizedBox(height: 16),
              Text(
                'Processing of Sensitive Data',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: appColors.secondary,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Personal data of customers/ employees will be securely stored in electronic or manual form and in accordance with the requisite legal compliances (law of the land). In addition, data collected for a specific purpose, product or service may be stored at Policy Vault with other information relating to an individual and only in accordance with the data protection principles mentioned above.',
                style: style,
              ),
              const SizedBox(height: 16),
              Text(
                'Data Transfer',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: appColors.secondary,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '''Policy Vault shall not disclose an individual's personal data outside their office except:''',
                style: style,
              ),
              const SizedBox(height: 16),
              DottedBullet(
                text:
                    "When Policy Vault has express consent to do so or in circumstances as agreed between  Policy Vault  and an individual.",
              ),
              DottedBullet(
                text: "When necessary to regulatory bodies and auditors.",
              ),
              DottedBullet(
                text:
                    "When Policy Vault is required or permitted to do so by Law.",
              ),
              DottedBullet(
                text: "To fraud prevention agencies where required.",
              ),
              const SizedBox(height: 16),
              Text(
                'Procedures and guidelines for Data Privacy',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: appColors.secondary,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              DottedBullet(
                text:
                    "Policy Vault shall maintain physical, technological and procedural safeguards and securities that comply with the requisite legal compliances (law of the land). Policy Vault to ensure high standards in relation to data protection.",
              ),
              DottedBullet(
                text:
                    "Below are some of the steps that Policy Vault shall take to ensure customers’/ employees’ data privacy.",
              ),
              DottedBullet(
                text:
                    "Access to sensitive data should be provided strictly on the basis of need to know.",
              ),
              DottedBullet(
                text: "Backup should be kept in a safe and secure environment.",
              ),
              DottedBullet(
                text:
                    "Sensitive personal data should be shared with proper authorization as required.",
              ),
              DottedBullet(
                text:
                    "Data kept in file servers or shared servers should have proper access controls.",
              ),
              DottedBullet(
                text:
                    "Logs of the systems should be taken periodically and reviewed to identify the user access for the applications and servers containing sensitive personal data.",
              ),
              DottedBullet(
                text:
                    "Strict disciplinary actions should be taken if any breach of data protection standard is identified as per this policy.",
              ),
              DottedBullet(
                text:
                    "Data privacy should be ensured in using the company’s resources such as laptops, online applications, external storage devices, file servers, records and documents.",
              ),
              const SizedBox(height: 16),
              Text(
                'Data Migration',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: appColors.secondary,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),

              DottedBullet(
                text:
                    "Data migration plan shall include methods for verification of completeness, consistency, and integrity of migration activity, pre and post- migration activities along with responsibilities and timelines for completion of the same.",
              ),
              DottedBullet(
                text:
                    "The key aspects that are required to be consider must include.",
              ),
              DottedBullet(
                text:
                    "Integrity of data: indicating that the data is not altered manually or electronically by a person, program and substitution or overwriting in the new system. Integrity thus, includes error creep due to factors like transposition, transcription, etc.",
              ),
              DottedBullet(
                text:
                    "Completeness: ensuring that the total number of records from the source database is transferred to the new database (assuming the number of fields is the same)",
              ),
              DottedBullet(
                text:
                    "Confidentiality of data under conversion: ensuring that data is backed up before migration for future reference or any emergency that might arise out of the data migration process.",
              ),
              DottedBullet(
                text:
                    "Consistency of data: field/ record called from the new application should be consistent with that of the original application. This should enable consistency in repeatability of the testing exercise.",
              ),
              DottedBullet(
                text:
                    "Continuity: new application should be able to continue with newer records as an addition (or appendage) and help in ensuring seamless business continuity.",
              ),
              const SizedBox(height: 10),
              Text(
                'Procedures and Guidelines for Data Migration',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: appColors.secondary,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              DottedBullet(
                text:
                    "IT data migration activity must ensure the key aspects which are mentioned above.",
              ),
              DottedBullet(
                text:
                    "Explicit sign- offs from users/ application owners need to be obtained after each stage of migration and after the completion of migration process.",
              ),
              DottedBullet(
                text:
                    "Each migration phase must include documentation of audit trails, error logs, root cause analysis, etc. for easy recovery from migration failure.",
              ),
              const SizedBox(height: 16),
              Text(
                'Data Privacy Incident Management',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: appColors.secondary,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'Any incident of data privacy violation must be reported immediately to the group ID at: ',
                      style: style,
                    ),
                    TextSpan(
                      text: "policyvault7@gmail.com",
                      style: TextTheme.of(context).bodyLarge?.copyWith(
                        color: appColors.primary,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationColor: appColors.hoverColor
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => sendEmail(),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
              Text(
                'Non-Compliance',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: appColors.secondary,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Failure to comply with this policy may, at the full discretion of Keewee Fintech Private Limited , result in disciplinary action as per the policy.',
                style: style,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void sendEmail() async {
    final subject = Uri.encodeComponent('''Let’s Connect!''');
    final body = Uri.encodeComponent(
      'Hi, thanks for connecting with us. Let us know if you have any questions regarding our privacy policy.',
    );

    final emailUri = Uri.parse(
      'mailto:policyvault7@gmail.com?subject=$subject&body=$body',
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }
}
