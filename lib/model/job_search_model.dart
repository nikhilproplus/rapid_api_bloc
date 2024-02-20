// To parse this JSON data, do
//
//     final jobSearchModel = jobSearchModelFromJson(jsonString);

import 'dart:convert';

JobSearchModel jobSearchModelFromJson(String str) =>
    JobSearchModel.fromJson(json.decode(str));

String jobSearchModelToJson(JobSearchModel data) => json.encode(data.toJson());

class JobSearchModel {
  String status;
  String requestId;
  Parameters parameters;
  List<Datum> data;

  JobSearchModel({
    required this.status,
    required this.requestId,
    required this.parameters,
    required this.data,
  });

  factory JobSearchModel.fromJson(Map<String, dynamic> json) => JobSearchModel(
        status: json["status"],
        requestId: json["request_id"],
        parameters: Parameters.fromJson(json["parameters"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "request_id": requestId,
        "parameters": parameters.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String employerName;
  String? employerLogo;
  String? employerWebsite;
  dynamic employerCompanyType;
  String jobPublisher;
  String jobId;
  String jobEmploymentType;
  String jobTitle;
  String jobApplyLink;
  bool jobApplyIsDirect;
  double jobApplyQualityScore;
  List<ApplyOption> applyOptions;
  String jobDescription;
  bool jobIsRemote;
  int jobPostedAtTimestamp;
  DateTime jobPostedAtDatetimeUtc;
  String jobCity;
  String jobState;
  String jobCountry;
  double jobLatitude;
  double jobLongitude;
  dynamic jobBenefits;
  String jobGoogleLink;
  DateTime? jobOfferExpirationDatetimeUtc;
  int? jobOfferExpirationTimestamp;
  JobRequiredExperience jobRequiredExperience;
  dynamic jobRequiredSkills;
  JobRequiredEducation jobRequiredEducation;
  bool jobExperienceInPlaceOfEducation;
  int? jobMinSalary;
  int? jobMaxSalary;
  String? jobSalaryCurrency;
  String? jobSalaryPeriod;
  JobHighlights jobHighlights;
  dynamic jobJobTitle;
  String jobPostingLanguage;
  String jobOnetSoc;
  String jobOnetJobZone;

  Datum({
    required this.employerName,
    required this.employerLogo,
    required this.employerWebsite,
    required this.employerCompanyType,
    required this.jobPublisher,
    required this.jobId,
    required this.jobEmploymentType,
    required this.jobTitle,
    required this.jobApplyLink,
    required this.jobApplyIsDirect,
    required this.jobApplyQualityScore,
    required this.applyOptions,
    required this.jobDescription,
    required this.jobIsRemote,
    required this.jobPostedAtTimestamp,
    required this.jobPostedAtDatetimeUtc,
    required this.jobCity,
    required this.jobState,
    required this.jobCountry,
    required this.jobLatitude,
    required this.jobLongitude,
    required this.jobBenefits,
    required this.jobGoogleLink,
    required this.jobOfferExpirationDatetimeUtc,
    required this.jobOfferExpirationTimestamp,
    required this.jobRequiredExperience,
    required this.jobRequiredSkills,
    required this.jobRequiredEducation,
    required this.jobExperienceInPlaceOfEducation,
    required this.jobMinSalary,
    required this.jobMaxSalary,
    required this.jobSalaryCurrency,
    required this.jobSalaryPeriod,
    required this.jobHighlights,
    required this.jobJobTitle,
    required this.jobPostingLanguage,
    required this.jobOnetSoc,
    required this.jobOnetJobZone,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        employerName: json["employer_name"],
        employerLogo: json["employer_logo"],
        employerWebsite: json["employer_website"],
        employerCompanyType: json["employer_company_type"],
        jobPublisher: json["job_publisher"],
        jobId: json["job_id"],
        jobEmploymentType: json["job_employment_type"],
        jobTitle: json["job_title"],
        jobApplyLink: json["job_apply_link"],
        jobApplyIsDirect: json["job_apply_is_direct"],
        jobApplyQualityScore: json["job_apply_quality_score"]?.toDouble(),
        applyOptions: List<ApplyOption>.from(
            json["apply_options"].map((x) => ApplyOption.fromJson(x))),
        jobDescription: json["job_description"],
        jobIsRemote: json["job_is_remote"],
        jobPostedAtTimestamp: json["job_posted_at_timestamp"],
        jobPostedAtDatetimeUtc:
            DateTime.parse(json["job_posted_at_datetime_utc"]),
        jobCity: json["job_city"],
        jobState: json["job_state"],
        jobCountry: json["job_country"],
        jobLatitude: json["job_latitude"]?.toDouble(),
        jobLongitude: json["job_longitude"]?.toDouble(),
        jobBenefits: json["job_benefits"],
        jobGoogleLink: json["job_google_link"],
        jobOfferExpirationDatetimeUtc:
            json["job_offer_expiration_datetime_utc"] == null
                ? null
                : DateTime.parse(json["job_offer_expiration_datetime_utc"]),
        jobOfferExpirationTimestamp: json["job_offer_expiration_timestamp"],
        jobRequiredExperience:
            JobRequiredExperience.fromJson(json["job_required_experience"]),
        jobRequiredSkills: json["job_required_skills"],
        jobRequiredEducation:
            JobRequiredEducation.fromJson(json["job_required_education"]),
        jobExperienceInPlaceOfEducation:
            json["job_experience_in_place_of_education"],
        jobMinSalary: json["job_min_salary"],
        jobMaxSalary: json["job_max_salary"],
        jobSalaryCurrency: json["job_salary_currency"],
        jobSalaryPeriod: json["job_salary_period"],
        jobHighlights: JobHighlights.fromJson(json["job_highlights"]),
        jobJobTitle: json["job_job_title"],
        jobPostingLanguage: json["job_posting_language"],
        jobOnetSoc: json["job_onet_soc"],
        jobOnetJobZone: json["job_onet_job_zone"],
      );

  Map<String, dynamic> toJson() => {
        "employer_name": employerName,
        "employer_logo": employerLogo,
        "employer_website": employerWebsite,
        "employer_company_type": employerCompanyType,
        "job_publisher": jobPublisher,
        "job_id": jobId,
        "job_employment_type": jobEmploymentType,
        "job_title": jobTitle,
        "job_apply_link": jobApplyLink,
        "job_apply_is_direct": jobApplyIsDirect,
        "job_apply_quality_score": jobApplyQualityScore,
        "apply_options":
            List<dynamic>.from(applyOptions.map((x) => x.toJson())),
        "job_description": jobDescription,
        "job_is_remote": jobIsRemote,
        "job_posted_at_timestamp": jobPostedAtTimestamp,
        "job_posted_at_datetime_utc": jobPostedAtDatetimeUtc.toIso8601String(),
        "job_city": jobCity,
        "job_state": jobState,
        "job_country": jobCountry,
        "job_latitude": jobLatitude,
        "job_longitude": jobLongitude,
        "job_benefits": jobBenefits,
        "job_google_link": jobGoogleLink,
        "job_offer_expiration_datetime_utc":
            jobOfferExpirationDatetimeUtc?.toIso8601String(),
        "job_offer_expiration_timestamp": jobOfferExpirationTimestamp,
        "job_required_experience": jobRequiredExperience.toJson(),
        "job_required_skills": jobRequiredSkills,
        "job_required_education": jobRequiredEducation.toJson(),
        "job_experience_in_place_of_education": jobExperienceInPlaceOfEducation,
        "job_min_salary": jobMinSalary,
        "job_max_salary": jobMaxSalary,
        "job_salary_currency": jobSalaryCurrency,
        "job_salary_period": jobSalaryPeriod,
        "job_highlights": jobHighlights.toJson(),
        "job_job_title": jobJobTitle,
        "job_posting_language": jobPostingLanguage,
        "job_onet_soc": jobOnetSoc,
        "job_onet_job_zone": jobOnetJobZone,
      };
}

class ApplyOption {
  String publisher;
  String applyLink;
  bool isDirect;

  ApplyOption({
    required this.publisher,
    required this.applyLink,
    required this.isDirect,
  });

  factory ApplyOption.fromJson(Map<String, dynamic> json) => ApplyOption(
        publisher: json["publisher"],
        applyLink: json["apply_link"],
        isDirect: json["is_direct"],
      );

  Map<String, dynamic> toJson() => {
        "publisher": publisher,
        "apply_link": applyLink,
        "is_direct": isDirect,
      };
}

class JobHighlights {
  JobHighlights();

  factory JobHighlights.fromJson(Map<String, dynamic> json) => JobHighlights();

  Map<String, dynamic> toJson() => {};
}

class JobRequiredEducation {
  bool postgraduateDegree;
  bool professionalCertification;
  bool highSchool;
  bool associatesDegree;
  bool bachelorsDegree;
  bool degreeMentioned;
  bool degreePreferred;
  bool professionalCertificationMentioned;

  JobRequiredEducation({
    required this.postgraduateDegree,
    required this.professionalCertification,
    required this.highSchool,
    required this.associatesDegree,
    required this.bachelorsDegree,
    required this.degreeMentioned,
    required this.degreePreferred,
    required this.professionalCertificationMentioned,
  });

  factory JobRequiredEducation.fromJson(Map<String, dynamic> json) =>
      JobRequiredEducation(
        postgraduateDegree: json["postgraduate_degree"],
        professionalCertification: json["professional_certification"],
        highSchool: json["high_school"],
        associatesDegree: json["associates_degree"],
        bachelorsDegree: json["bachelors_degree"],
        degreeMentioned: json["degree_mentioned"],
        degreePreferred: json["degree_preferred"],
        professionalCertificationMentioned:
            json["professional_certification_mentioned"],
      );

  Map<String, dynamic> toJson() => {
        "postgraduate_degree": postgraduateDegree,
        "professional_certification": professionalCertification,
        "high_school": highSchool,
        "associates_degree": associatesDegree,
        "bachelors_degree": bachelorsDegree,
        "degree_mentioned": degreeMentioned,
        "degree_preferred": degreePreferred,
        "professional_certification_mentioned":
            professionalCertificationMentioned,
      };
}

class JobRequiredExperience {
  bool noExperienceRequired;
  int? requiredExperienceInMonths;
  bool experienceMentioned;
  bool experiencePreferred;

  JobRequiredExperience({
    required this.noExperienceRequired,
    required this.requiredExperienceInMonths,
    required this.experienceMentioned,
    required this.experiencePreferred,
  });

  factory JobRequiredExperience.fromJson(Map<String, dynamic> json) =>
      JobRequiredExperience(
        noExperienceRequired: json["no_experience_required"],
        requiredExperienceInMonths: json["required_experience_in_months"],
        experienceMentioned: json["experience_mentioned"],
        experiencePreferred: json["experience_preferred"],
      );

  Map<String, dynamic> toJson() => {
        "no_experience_required": noExperienceRequired,
        "required_experience_in_months": requiredExperienceInMonths,
        "experience_mentioned": experienceMentioned,
        "experience_preferred": experiencePreferred,
      };
}

class Parameters {
  String query;
  int page;
  int numPages;

  Parameters({
    required this.query,
    required this.page,
    required this.numPages,
  });

  factory Parameters.fromJson(Map<String, dynamic> json) => Parameters(
        query: json["query"],
        page: json["page"],
        numPages: json["num_pages"],
      );

  Map<String, dynamic> toJson() => {
        "query": query,
        "page": page,
        "num_pages": numPages,
      };
}
