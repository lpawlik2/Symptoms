# Importance of Symptom Data

Interoperability is a vital component of clinical practice, facilitating the seamless exchange of patient data across different systems and settings. Symptom data is particularly crucial for accurate diagnoses, early intervention, and personalized care.

- Symptoms are often the first indication of an underlying condition or disease. Accurately identifying and documenting symptoms helps healthcare providers diagnose conditions correctly and develop effective treatment plans.
- Recognizing symptoms early on enables healthcare providers to intervene promptly, reducing the risk of complications and improving patient outcomes.
- Identifying symptoms helps healthcare providers understand the unique needs and experiences of each patient, enabling them to provide personalized care and tailored interventions.


# Features of Symptom Data

Patient-reported symptom data can provide valuable insights into the patient's experience and perspective, enabling personalized care. When collecting this data is an important to capture the reporter of the symptom (patient, family member, or caregiver), the method of reporting (verbal, written, or electronic), and the format of the report (questionnaires, notes, etc.).

Consistent and reliable documentation of symptom data by care teams is also critical and should include several key attributes including the healthcare provider responsible for documenting the symptom (physician, nurse, or allied health professional), the timing, and the format used (notes, standardized forms, etc.).

The timing of symptoms, including onset, frequency, and duration, is another important aspect of symptom data. Understanding when symptoms began, how often they occur, and how long they persist can provide valuable insights into the underlying cause and severity of the symptom.

Severity informs treatment decisions, such as medication dosing, therapy intensity, and hospitalization needs. And, tracking symptom severity over time enables healthcare providers to assess treatment effectiveness and adjust plans accordingly.

Knowing the location of symptoms enables healthcare providers to target interventions, such as pain management or physical therapy, to the specific area of need.

Additionally, contextual information about symptoms, including surrounding events, triggers, exacerbating factors, and alleviating factors, can enable healthcare providers to develop more informed and effective care strategies that address the complex needs of patients. For instance, what was happening when the symptom started, what makes it worse or better, and what relieves it can all inform diagnosis and treatment plans. Moreover, understanding how symptoms affect a patient's ability to engage in normal physical activity or work can help healthcare providers develop targeted interventions and support.


# Symptom Profile
 
 The Symptom profile, based on the [US Core Simple Observation Profile](https://build.fhir.org/ig/HL7/US-Core/StructureDefinition-us-core-simple-observation.html), includes data elements to capture comprehensive information about symptoms, including their timing, severity, and context. The profile's structure also allows for flexibility and customization to capture symptom-specific information. Key data elements include:

- `manifestation`: code classifying symptoms as acute, chronic, continuous, episodic, intermittent, or transient
- `basedOn`: reference to care plans, medication requests, etc.
- `code`: code for the specific symptom
- `encounter`: reference to the healthcare event during which the observation was made
- `effective`: clinically relevant time or period for the symptom
- `performer`: individual responsible for the observation
- `note`: free-text related to the symptom
- `bodySite`: code for the location of the symptom
- `derivedFrom`: reference to diagnostic report, questionnaire response, other observation, etc.
- `component`: timing (frequency, duration, etc.), specific scales or assessments (e.g., pain scale), and presence or absence of related item or event (trigger, alleviating factor, exacerbating factor, risk factor, etc.)


# Related Profiles

References provide a way of relating to or from other profiles (encounter, conditions, etc.). Within the Symptom profile, the `encounter` element provides a means for identifying symptoms that presented together at the same encounter. The `basedOn` element enables linking to care plans, medication requests, etc. And, the `derivedFrom` element allows for linking to diagnostic report, questionnaire response, etc. in which the symptom was  documented.

From the [US Core Condition Problems and Health Concerns Profile](https://build.fhir.org/ig/HL7/US-Core/StructureDefinition-us-core-condition-problems-health-concerns.html), the `evidence.detail` element allows for linking to supporting information related to a diagnosis such as symptoms. From the [US Core ServiceRequest Profile](https://build.fhir.org/ig/HL7/US-Core/StructureDefinition-us-core-servicerequest.html), [US Core Medication Request Profile](https://build.fhir.org/ig/HL7/US-Core/StructureDefinition-us-core-medicationrequest.html), and [US Core Procedure Profile](https://build.fhir.org/ig/HL7/US-Core/StructureDefinition-us-core-procedure.html), the `reasonReference` element allows for linking to the reason for the service or medication such as treatment of a symptom.​

![symptom-diagram](symptom-diagram.png)
