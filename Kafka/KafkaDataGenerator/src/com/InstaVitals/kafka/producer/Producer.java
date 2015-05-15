package com.InstaVitals.kafka.producer;

import java.util.Date;
import java.util.Properties;
import java.util.Scanner;
import java.util.concurrent.Future;

import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.clients.producer.RecordMetadata;

import com.InstaVitals.kafka.model.VitalRecord;
import com.InstaVitals.kafka.sensor.BPSensor;
import com.InstaVitals.kafka.sensor.BPSensor1;
import com.InstaVitals.kafka.sensor.TemperatureSensor;
import com.InstaVitals.kafka.sensor.WeightSensor;
import com.InstaVitals.kafka.util.JsonHelper;

public class Producer {

	private static KafkaProducer<String, String> producer;
	private static String topic = "heart1";

	public Producer() {

	}

	public static void main(String[] args) {
		Properties props = new Properties();
		props.put("bootstrap.servers", "54.69.1.169:9092");
		props.put("key.serializer",
		    "org.apache.kafka.common.serialization.StringSerializer");
		props.put("value.serializer",
		    "org.apache.kafka.common.serialization.StringSerializer");
		props.put("request.required.acks", "1");
		producer = new KafkaProducer<String, String>(props);

		TemperatureSensor temperatureSensor = new TemperatureSensor();
		BPSensor bpSensor = new BPSensor();
		BPSensor1 bpSensor1 = new BPSensor1();
		WeightSensor weightSensor = new WeightSensor();

		Scanner scanner = new Scanner(System.in);

		System.out.println("Enter patient name:");
		String patientName = scanner.nextLine();

		System.out.println("Enter patient ID:");
		int patientId = scanner.nextInt();

		Date visitDate = new Date();
		String temprature = temperatureSensor.sense().toString();
		String bp = bpSensor.sense().toString();
		String bp2 = bpSensor1.sense().toString();
		String weight = weightSensor.sense().toString();

		VitalRecord record = new VitalRecord();
		record.setPatientId(patientId);
		record.setBp(bp);
		record.setBp2(bp2);
		record.setPatientName(patientName);
		record.setTemprature(temprature);
		record.setVisitDate(visitDate);
		record.setWeight(weight);

		String msg = JsonHelper.getInstance().toJson(record);
		ProducerRecord<String, String> data = new ProducerRecord<String, String>(
		    topic, "1", msg);
		Future<RecordMetadata> rs = producer.send(data,
		    new org.apache.kafka.clients.producer.Callback() {

			    @Override
			    public void onCompletion(RecordMetadata recordMetadata,
			        Exception arg1) {
					System.out.println("Record stored successfully!");
			    }
		    });

		try {
			RecordMetadata rm = rs.get();
			msg = msg + " partition = " + rm.partition() + " offset ="
			    + rm.offset();
			System.out.println(msg);
		} catch (Exception e) {
			System.out.println(e);
		}
		producer.close();
		scanner.close();
	}
}
