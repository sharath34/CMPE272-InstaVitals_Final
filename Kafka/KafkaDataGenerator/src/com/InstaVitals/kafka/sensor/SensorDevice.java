package com.InstaVitals.kafka.sensor;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.concurrent.Future;

import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.clients.producer.RecordMetadata;

public class SensorDevice implements ISensor {
	private ISensor tempsensor = new TemperatureSensor();
	private ISensor heightsensor = new HeightSensor();
	private ISensor weightsensor = new WeightSensor();

	private KafkaProducer<String, String> producer;
	private String date = "04092014";
	// String topic = "my-replicated-topic" ;
	private String topic = "sensordata";

	public SensorDevice() {
		Properties props = new Properties();
		// props.put("metadata.broker.list", "host2:9092,host3:9092");
		props.put("bootstrap.servers", "54.69.1.169:9092");
		// props.put("serializer.class", "kafka.serializer.StringEncoder");
		props.put("key.serializer",
				"org.apache.kafka.common.serialization.StringSerializer");
		props.put("value.serializer",
				"org.apache.kafka.common.serialization.StringSerializer");
		// props.put("partitioner.class", "example.producer.SimplePartitioner");
		props.put("request.required.acks", "1");
		producer = new KafkaProducer<String, String>(props);

	}

	@Override
	public Map<String, Object> sense() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("Temperature", tempsensor.sense());
		map.put("Height", heightsensor.sense());
		map.put("Weight", weightsensor.sense());
		return map;
	}

	public void run() {

		Object sensonrData = sense();

		ProducerRecord<String, String> data = new ProducerRecord<String, String>(
				topic, "Sensor", sensonrData.toString());
		System.out.println(data);
		Future<RecordMetadata> rs = producer.send(data,
				new org.apache.kafka.clients.producer.Callback() {

					@Override
					public void onCompletion(RecordMetadata recordMetadata,
							Exception arg1) {
						System.out.println("Received ack for partition="
								+ recordMetadata.partition() + " offset = "
								+ recordMetadata.offset());
					}
				});

		try {
			String msg = "";
			RecordMetadata rm = rs.get();
			msg = msg + " partition = " + rm.partition() + " offset ="
					+ rm.offset();
			System.out.println(msg);
		} catch (Exception e) {
			System.out.println(e);
		}
		producer.close();

	}

	public ISensor getTempsensor() {
		return tempsensor;
	}

	public void setTempsensor(ISensor tempsensor) {
		this.tempsensor = tempsensor;
	}

	public ISensor getHeightsensor() {
		return heightsensor;
	}

	public void setHeightsensor(ISensor heightsensor) {
		this.heightsensor = heightsensor;
	}

	public ISensor getWeightsensor() {
		return weightsensor;
	}

	public void setWeightsensor(ISensor weightsensor) {
		this.weightsensor = weightsensor;
	}
}
