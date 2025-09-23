import { useBackend } from '../backend';
import { Window } from '../layouts';
import { Box, Button, Section } from 'tgui-core/components';

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
        <Section title="Простой интерфейс">
          <Box>Привет, {user_name}!</Box>
          <Box>{message}</Box>
          <Button onClick={() => act('test_button')}>
            Нажми меня!
          </Button>
        </Section>
      </Window.Content>
    </Window>
  );
};