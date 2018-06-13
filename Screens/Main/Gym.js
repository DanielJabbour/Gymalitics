import React from 'react';
import { Button, Text, View, StyleSheet, StatusBar } from 'react-native';

export default class GymScreen extends React.Component {
    render() {
      return (
        <View style={styles.container}>
            <StatusBar 
                barStyle="light-content"
            />

            <Text>Gym!</Text>
        </View>
      );
    }
}

const styles = StyleSheet.create({
    container: {
      backgroundColor: '#2c3e50',
      flex: 1,
      justifyContent: 'center',
      alignItems: 'center'
    }
  })