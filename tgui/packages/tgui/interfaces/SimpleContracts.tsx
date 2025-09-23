import { useBackend } from '../backend';
import { Window } from '../layouts';

// Типы данных (что приходит из DM кода)
type SimpleData = {
  user_name: string;
  message: string;
};

// Главный компонент интерфейса
export const SimpleContracts = () => {
  const { act, data } = useBackend<SimpleData>();
  const { user_name, message } = data;

  return (
    <Window width={400} height={200}>
      <Window.Content>
        <div style={{ padding: '10px' }}>
          <h2>Простой интерфейс</h2>
          <p>Привет, {user_name}!</p>
          <p>{message}</p>
          <button 
            onClick={() => act('test_button')}
            style={{
              padding: '8px 16px',
              backgroundColor: '#4CAF50',
              color: 'white',
              border: 'none',
              borderRadius: '4px',
              cursor: 'pointer'
            }}
          >
            Нажми меня!
          </button>
        </div>
      </Window.Content>
    </Window>
  );
};