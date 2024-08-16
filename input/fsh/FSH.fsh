Alias: $observation = http://hl7.org/fhir/StructureDefinition/Observation
Alias: $loinc = http://loinc.org
Alias: $snomed = https://www.snomed.org

RuleSet: Meta
* ^publisher = "National Quality Forum"
* ^version = "0.0.1"
* ^status =  #draft
* ^date = "2024-05-27"
* ^contact.name = "National Quality Forum"
* ^contact.telecom[0].system = #url
* ^contact.telecom[=].value = "https://www.qualityforum.org"
* ^copyright = " "

ValueSet: ManifestationVS
* insert Meta
* include $snomed#53737009 "Acute"
* include $snomed#90734009 "Chronic"
* include $snomed#255238004 "Continuous"
* include $snomed#278499009 "Episodic"
* include $snomed#7087005 "Intermittent"
* include $snomed#255276005 "Transient"

Extension: Manifestation
Context: extension
Description: "Manifestation or course of the symptom (e.g., acute, chronic, episodic)"
* insert Meta
* value[x] only code
* value[x] from ManifestationVS (extensible)

ValueSet: TimingVS
* insert Meta
/** include $snomed#405795006 "Onset"*/
* include $snomed#162451001 "Frequency"
* include $snomed#103335007 "Duration"
/** include $loinc#88878-4 "Date of condition abatement"*/

/*CodeSystem: PrecisionCS
* insert Meta
* #exact "Exact"
* #estimated "Estimated"

ValueSet: PrecisionVS
* insert Meta
* include codes from system PrecisionCS

Extension: Precision
Context: SymptomProfile.component[timing].extension
* insert Meta
* value[x] only code
* value[x] from PrecisionVS (required)

Extension: IsEpisodic
Context: SymptomProfile.component[timing].extension
* insert Meta
* value[x] only boolean*/

ValueSet: ScaleVS
* insert Meta
* include codes from system $snomed where concept is-a #4157120 "Assessment scales"

/*Extension: Scale
Context: SymptomProfile.component[severity].extension
* insert Meta
* value[x] only code
* value[x] from ScaleVS (required)*/

ValueSet: RelatedTypeVS
* insert Meta
* include $loinc#TBD "Trigger"
* include $loinc#100752-5 "Exacerbating Factor"
* include $loinc#100753-3 "Alleviating Factor"
* include $loinc#46467-7 "Risk Factor"

CodeSystem: RelatedStatusCS
* insert Meta
* #absent "Absent"
* #present "Present"

ValueSet: RelatedStatusVS
* insert Meta
* include codes from system RelatedStatusCS

Extension: RelatedStatus
Context: SymptomProfile.component[related].extension
Description: "Status of related event or item (e.g., absent, present)"
* insert Meta
* value[x] only code
* value[x] from RelatedStatusVS (extensible)

Profile: SymptomProfile
Parent: $observation
Title: "Symptom Profile"
Description: " "
* insert Meta
* . ^short = "Symptom Profile"
* extension contains Manifestation named manifestation 0..1
* value[x] 0..0
* dataAbsentReason 0..0
* interpretation 0..0
* method 0..0
* specimen 0..0
* device 0..0
* referenceRange 0..0
* category = $loinc#75325-1 "Symptom" (exactly)
* code ^short = "Specifies the symptom"
* component ..*
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.ordered = false
* component ^slicing.rules = #open
* component.interpretation 0..0
* component.referenceRange 0..0
* component contains
    timing 0..* and
    assessment 0..* and
    related 0..*
* component[timing] ^short = "Timing"
* component[timing].code 1..1
* component[timing].code from TimingVS (extensible)
* component[timing].code ^short = "Type of timing element (e.g., frequency, duration)"
* component[timing].value[x] only time or dateTime or Period or Quantity
//* component[timing].extension contains IsEpisodic named isEpisodic 0..1
//* component[timing].extension contains Precision named precision 0..1
* component[timing].interpretation 0..0
* component[timing].referenceRange 0..0
* component[assessment] ^short = "Assessment"
* component[assessment].code 1..1
* component[assessment].code ^short = "Code for specific scale or assessment (e.g., pain scale, anxiety inventory)"
* component[assessment].code from ScaleVS (extensible)
* component[assessment].value[x] only Ratio or CodeableConcept
/** component[severity].extension contains Scale named scale 1..1*/
* component[assessment].interpretation 0..0
* component[assessment].referenceRange 0..0
* component[related] ^short = "Related Item or Event"
* component[related].code 1..1
* component[related].code ^short = "Type of related event or item (e.g., trigger, alleviating factor, exacerbating factor, risk factor)"
* component[related].code from RelatedTypeVS (extensible)
* component[related].value[x] only string or CodeableConcept
* component[related].extension contains RelatedStatus named status 1..1
* component[related].interpretation 0..0
* component[related].referenceRange 0..0