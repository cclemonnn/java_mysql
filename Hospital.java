import java.sql.*;
import java.util.Scanner;


public class Hospital {
    public static void main(String[] args) {

            Scanner scanner = new Scanner(System.in);
            boolean start = true;
            String input;
            String sql;
            int row;
            while (true){
                if (start) {
                    System.out.println("Room Utilization");
                    System.out.println("""
                            \tr1: List the rooms that are occupied, along with the associated patient names and the date the patient was admitted.
                            \tr2: List the rooms that are currently unoccupied.
                            \tr3: List all rooms in the hospital along with patient names and admission dates for those that are occupied.""");

                    System.out.println("\nPatient Information");
                    System.out.println("""
                            \tp1: List all patients in the database, with full personal information.
                            \tp2: List all patients currently admitted to the hospital. List only patient identification number and name.
                            \tp3: List all patients who were discharged in a given date range. List only patient identification number and name.
                            \tp4: List all patients who were admitted within a given date range. List only patient identification number and name.
                            \tp5: For a given patient (either patient identification number or name), list all admissions to the hospital along with the diagnosis for each admission.
                            \tp6: For a given patient (either patient identification number or name), list all treatments that were administered. Group treatments by admissions. List admissions in descending chronological order, and list treatments in ascending chronological order within each admission.
                            \tp7: List patients who were admitted to the hospital within 30 days of their last discharge date. For each patient list their patient identification number, name, diagnosis, and admitting doctor.
                            \tp8: For each patient that has ever been admitted to the hospital, list their total number of admissions, average duration of each admission, longest span between admissions, shortest span between admissions, and average span between admissions.""");

                    System.out.println("\nDiagnosis and Treatment Information");
                    System.out.println("""
                            \td1: List the diagnoses given to patients, in descending order of occurrences. List diagnosis identification number, name, and total occurrences of each diagnosis.
                            \td2: List the diagnoses given to hospital patients, in descending order of occurrences. List diagnosis identification number, name, and total occurrences of each diagnosis.
                            \td3: List the treatments performed on admitted patients, in descending order of occurrences. List treatment identification number, name, and total number of occurrences of each treatment.
                            \td4: List the diagnoses associated with patients who have the highest occurrences of admissions to the hospital, in ascending order or correlation.
                            \td5: For a given treatment occurrence, list the patient name and the doctor who ordered the treatment.""");

                    System.out.println("\nEmployee Information");
                    System.out.println("""
                            \te1: List all workers at the hospital, in ascending last name, first name order. For each worker, list their, name, and job category.
                            \te2: List the primary doctors of patients with a high admission rate (at least 4 admissions within a one-year time frame).
                            \te3: For a given doctor, list all associated diagnoses in descending order of occurrence. For each diagnosis, list the total number of occurrences for the given doctor.
                            \te4: For a given doctor, list all treatments that they ordered in descending order of occurrence. For each treatment, list the total number of occurrences for the given doctor.
                            \te5: List employees who have been involved in the treatment of every admitted patient.""");


                    System.out.println("""

                            To select a query, type in the code presented before each query above.\s
                            For example, type in r2 then press Enter to get a list of all patients in the database, with full personal information.""");

                    start = false;
                }

                System.out.print("Enter a code or type exit to end the program: ");

                input = scanner.next().trim();


                if (input.equals("r1")){
                    sql = "select room_id, firstname, lastname, admission_date" +
                            " from room_assignment" +
                            " natural join patients" +
                            " natural join primary_doctor" +
                            " natural join admission_diagnosis;";
                    row = 4;
                    printQuery(sql, row);

                } else if (input.equals("r2")) {
                    sql = "select room_id" +
                            " from room_assignment where patient_id is null;";
                    row = 1;
                    printQuery(sql, row);

                } else if (input.equals("r3")) {
                    sql = "select room_id, patients.firstname, patients.lastname, admission_date" +
                            " from room_assignment" +
                            " left join patients on patients.patient_id = room_assignment.patient_id" +
                            " left join primary_doctor on primary_doctor.patient_id = patients.patient_id" +
                            " left join admission_diagnosis on admission_diagnosis.admission_id = primary_doctor.admission_id;";

                    row = 4;
                    printQuery(sql, row);

                } else if (input.equals("p1")) {
                    sql = "select *" +
                            " from patients;";
                    row = 7;
                    printQuery(sql, row);

                } else if (input.equals("p2")) {
                    sql = "select patient_id, firstname, lastname" +
                            " from admitted_patients" +
                            " natural join patients;";

                    row = 3;
                    printQuery(sql, row);

                } else if (input.equals("p3")) {
                    //get date ranges from user
//                    System.out.println("\nPlease enter 2 dates for date ranges." +
//                            "\nFor example, if the date range is between 2022-10-01 and 2022-10-15, " +
//                            "please enter 2022-10-01 as date1" +
//                            "and 2022-10-15 as date2 (with the same format provided).");
//
//                    System.out.print("Enter date1: ");
//                    String date1 = scanner.next().trim();
//
//                    System.out.print("Enter date2: ");
//                    String date2 = scanner.next().trim();

                    System.out.println("Date ranges between 2022-10-01 and 2022-10-15");

                    sql = "select patient_id, firstname, lastname" +
                            " from discharge" +
                            " natural join patients" +
                            " where discharge_time between '2022-10-01 00:00:00' and '2022-10-15 00:00:00';";

                    row = 3;
                    printQuery(sql, row);

                } else if (input.equals("p4")) {
                    System.out.println("Date ranges between 2022-10-01 and 2022-10-03");

                    sql = "select patient_id, firstname, lastname" +
                            " from admitted_patients" +
                            " natural join patients" +
                            " natural join primary_doctor" +
                            " natural join admission_diagnosis" +
                            " where admission_date between '2022-10-01' and '2022-10-03';";

                    row = 3;
                    printQuery(sql, row);

                } else if (input.equals("p5")) {
                    System.out.println("Patient ID: p7");

                    sql = "select primary_doctor.admission_id" +
                            ", (select group_concat(distinct diag_id separator ',')) as all_diag_ids" +
                            " from primary_doctor" +
                            " left join patient_diagnosis" +
                            " on patient_diagnosis.admission_id = primary_doctor.admission_id" +
                            " where patient_id = 'p7'" +
                            " group by primary_doctor.admission_id;";

                    row = 2;
                    printQuery(sql, row);

                } else if (input.equals("p6")) {
                    System.out.println("Patient ID: p7");

                    sql = "select treatment_id, admission_date" +
                            " from treatment_administration" +
                            " natural join patient_treatment" +
                            " natural join patients" +
                            " natural join admission_diagnosis" +
                            " where patient_id = 'p7'" +
                            " order by admission_date desc, administer_time asc;";

                    row = 2;
                    printQuery(sql, row);

                } else if (input.equals("p7")) {
                    sql = "select patient_id, firstname, lastname, init_diagnosis, doctor_id" +
                            " from patients" +
                            " natural join" +
                            " (select max(discharge_time) as discharge_time, patient_id" +
                            " from discharge" +
                            " group by patient_id) max_dis" +
                            " natural join primary_doctor" +
                            " natural join admission_diagnosis" +
                            " where timestampdiff(day, admission_date, discharge_time)" +
                            " between -30 and 30;";

                    row = 5;
                    printQuery(sql, row);

                } else if (input.equals("p8")) {
                    sql = "select admi_day.*" +
                            " , admi_day.total_admi_day / admi_day.number_of_admi as average_admi_duration_day" +
                            " , span_table_2.shortest_span_day" +
                            " , span_table_2.longest_span_day" +
                            " , span_table_2.average_span_day" +
                            " from (" +
                            " select primary_doctor.patient_id" +
                            " , sum(timestampdiff(day, admission_date, ifnull(discharge_time, curdate()))) as total_admi_day" +
                            " , count(primary_doctor.patient_id) as number_of_admi" +
                            " from admission_diagnosis" +
                            " natural join primary_doctor" +
                            " natural join patients" +
                            " left join discharge on discharge.admission_id = primary_doctor.admission_id" +
                            " group by primary_doctor.patient_id) admi_day" +
                            " natural join" +
                            " (select span_table.*" +
                            " from" +
                            " (" +
                            " select new_span2.patient_id" +
                            " ,min(new_span2.span) as shortest_span_day" +
                            " , max(new_span2.span) as longest_span_day" +
                            " , sum(new_span2.span) / count(new_span2.patient_id) as average_span_day" +
                            " from" +
                            " (select new_span.patient_id" +
                            " , case" +
                            " when new_span.prev_admi is not null then timestampdiff(day, new_span.prev_admi, new_span.admission_date)" +
                            " else 0" +
                            " end as span" +
                            " from (" +
                            " select primary_doctor.patient_id" +
                            " , admission_diagnosis.admission_date" +
                            " , LAG(admission_date, 1) OVER (" +
                            " PARTITION BY primary_doctor.patient_id" +
                            " order by admission_date" +
                            " ) prev_admi" +
                            " from admission_diagnosis" +
                            " natural join primary_doctor" +
                            " natural join patients" +
                            " left join discharge on discharge.admission_id = primary_doctor.admission_id) new_span" +
                            " ) new_span2" +
                            " group by new_span2.patient_id) span_table) span_table_2;";

                    row = 7;
                    printQuery(sql, row);

                } else if (input.equals("d1")) {
                    sql = "select *" +
                            " from diagnosis" +
                            " natural join" +
                            " ( select diag_id, count(diag_id) as occurrences" +
                            " from patient_diagnosis" +
                            " group by diag_id) diag" +
                            " order by diag.occurrences desc;";

                    row = 3;
                    printQuery(sql, row);

                } else if (input.equals("d2")) {
                    sql = "select diag_id, diag_name, count(diag_id) as occurrences" +
                            " from admitted_patients" +
                            " natural join primary_doctor" +
                            " natural join patient_diagnosis" +
                            " natural join diagnosis" +
                            " group by diag_id" +
                            " order by count(diag_id) desc;";

                    row = 3;
                    printQuery(sql, row);
                } else if (input.equals("d3")) {
                    sql = "select treatment_id, treat_name, count(treatment_id) as occurrences" +
                            " from admitted_patients" +
                            " natural join patient_treatment" +
                            " natural join order_perform_treatment" +
                            " natural join treatments" +
                            " group by treatment_id" +
                            " order by count(treatment_id) desc;";

                    row = 3;
                    printQuery(sql, row);

                } else if (input.equals("d4")) {
                    sql = "select diag_id, diag_name" +
                            " from admission_diagnosis" +
                            " natural join primary_doctor" +
                            " left join patient_diagnosis" +
                            " on primary_doctor.admission_id = patient_diagnosis.admission_id" +
                            " left join" +
                            " (select patient_id" +
                            " from admission_diagnosis" +
                            " natural join primary_doctor" +
                            " group by patient_id" +
                            " order by count(patient_id) desc limit 1) highest" +
                            " on primary_doctor.patient_id = highest.patient_id" +
                            " natural join diagnosis" +
                            " where highest.patient_id is not null" +
                            " and diag_id is not null" +
                            " group by diag_id" +
                            " order by count(diag_id);";

                    row = 2;
                    printQuery(sql, row);

                } else if (input.equals("d5")) {
                    System.out.println("Treatment occurrences: 1");

                    sql = "select treatment_id, occurrences, firstname as p_firstname, lastname as p_lastname, doctor_id\n" +
                            " from" +
                            " (select * , count(treatment_id) as occurrences" +
                            " from order_perform_treatment" +
                            " natural join patient_treatment" +
                            " group by treatment_id) oc" +
                            " natural join assigned_doctors" +
                            " natural join doctors" +
                            " natural join patients" +
                            " where occurrences = 1;";

                    row = 5;
                    printQuery(sql, row);

                } else if (input.equals("e1")) {
                    sql = "select firstname, lastname, category" +
                            " from employees" +
                            " right join doctors" +
                            " on doctors.employee_id = employees.employee_id" +
                            " union" +
                            " select firstname, lastname, category" +
                            " from employees" +
                            " right join nurses" +
                            " on nurses.employee_id = employees.employee_id" +
                            " union" +
                            " select firstname, lastname, category" +
                            " from employees" +
                            " right join technicians" +
                            " on technicians.employee_id = employees.employee_id" +
                            " union" +
                            " select firstname, lastname, category" +
                            " from employees" +
                            " right join administrators" +
                            " on administrators.employee_id = employees.employee_id" +
                            " union" +
                            " select firstname, lastname, category" +
                            " from employees" +
                            " right join staffs" +
                            " on staffs.employee_id = employees.employee_id" +
                            " order by lastname, firstname;";

                    row = 3;
                    printQuery(sql, row);
                    
                } else if (input.equals("e2")) {
                    sql = "select doctor_id" +
                            " , firstname as d_firstname" +
                            " , lastname as d_lastname" +
                            " , patient_id" +
                            " from primary_doctor" +
                            " natural join" +
                            " (select patient_id, count(patient_id) as total_admi_num" +
                            " , min(admission_date) as min_date" +
                            " , max(admission_date) as max_date" +
                            " from primary_doctor" +
                            " natural join admission_diagnosis" +
                            " group by patient_id) high_admi" +
                            " natural join doctors" +
                            " natural join employees" +
                            " where timestampdiff(year, high_admi.min_date, high_admi.max_date) < 1" +
                            " and high_admi.total_admi_num >= 4" +
                            " group by doctor_id;";

                    row = 4;
                    printQuery(sql, row);

                } else if (input.equals("e3")) {
                    System.out.println("Doctor ID: d1");

                    sql = "select diag_id" +
                            " , diag_name" +
                            " , count(diag_id) as occurrences" +
                            " from patient_diagnosis" +
                            " natural join diagnosis" +
                            " where doctor_id = 'd1'" +
                            " group by diag_id" +
                            " order by max(diag_date) desc;";

                    row = 3;
                    printQuery(sql, row);

                } else if (input.equals("e4")) {
                    System.out.println("Doctor ID: d4");

                    sql = "select treatment_id" +
                            " , treat_name" +
                            " , count(treatment_id) as occurrences" +
                            " from" +
                            " (select *" +
                            " from assigned_doctors" +
                            " natural join order_perform_treatment" +
                            " natural join patient_treatment" +
                            " natural join treatments" +
                            " where doctor_id = 'd2') d2_treat" +
                            " group by treatment_id" +
                            " order by order_time desc;";

                    row = 3;
                    printQuery(sql, row);

                } else if (input.equals("e5")) {
                    sql = "select employee_id, firstname, lastname" +
                            " from employees" +
                            " natural join doctors" +
                            " natural join" +
                            " (select doctor_id" +
                            " from" +
                            " (select (select group_concat(distinct patient_id separator ',')) as ids" +
                            " , doctor_id" +
                            " from admitted_patients" +
                            " natural join patient_treatment" +
                            " natural join order_perform_treatment" +
                            " natural join assigned_doctors" +
                            " group by doctor_id) all_treats" +
                            " left join" +
                            " (select (select group_concat(patient_id separator ',')) as all_ids" +
                            " from admitted_patients) all_p" +
                            " on all_p.all_ids = all_treats.ids" +
                            " where all_p.all_ids is not null) doc;";

                    row = 3;
                    printQuery(sql, row);


                } // exit
                else if (input.equals("exit")) {
                    System.exit(1);
                } // invalid input
                else {
                    System.out.println("Please enter a valid code.\n");
                }
            }
    }

    public static void printQuery(String sql, int row) {
        try {
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/final_project", "root", "peter1995");
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            ResultSetMetaData rsmd = resultSet.getMetaData();

            // print column names
            System.out.print("\t");
            for (int i = 1; i <= row; i++) {
                System.out.print(rsmd.getColumnName(i) + "  ");
            }
            System.out.println();

            //print all rows
            while (resultSet.next()) {
                System.out.print("\t");
                for (int i = 1; i <= row; i++) {
                    System.out.print(resultSet.getString(i) + "  ");
                }
                System.out.println();
            }
            System.out.println();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
